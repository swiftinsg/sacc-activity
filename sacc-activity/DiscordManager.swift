import Foundation
import DiscordBM
import AsyncHTTPClient

class DiscordManager: ObservableObject {
    @Published var activityGroups = groupNames.map {
        ActivityGroup(groupId: $0.groupId, groupName: $0.name)
    }

    @Published var presentedSceneIDs: Set<UUID> = []

    @Published var currentScene: ActivitySubscene = .init(systemImage: "", title: "", state: .empty) {
        didSet {
            oldValue.onEnd?(self)
            currentScene.onStart?(self)
        }
    }

    @Published var currentActivitySceneIndex = 0
    @Published var activeSlashCommand: String?
    @Published var submissions: [Submission] = []

    @Published var activityScenes: [any ActivityScene] = [
        WelcomeActivityScene(),
        FlagCreationActivityScene(),
        AppIdeaActivityScene(),
        TriviaActivityScene(),
        ClosingActivityScene()
    ]

    let discordInfo = DiscordInfo.getInformation()

    var bot: BotGatewayManager?

    init() {
        Task.detached {
            await self.initialize()
        }
    }

    func initialize() async {
        let httpClient = HTTPClient(eventLoopGroupProvider: .singleton)

        self.bot = await BotGatewayManager(
            eventLoopGroup: httpClient.eventLoopGroup,
            httpClient: httpClient,
            token: discordInfo.token,
            presence: .init(
                activities: [.init(name: "Taylor Swift", type: .listening)],
                status: .online,
                afk: false
            ),
            intents: Gateway.Intent.allCases
        )

        await setUpSlashCommands()
        await bot?.connect()

        for await event in await bot!.events {
            AddCommandEventHandler(
                event: event,
                manager: self
            ).handle()
        }
    }
}

private struct AddCommandEventHandler: GatewayEventHandler, @unchecked Sendable {
    let event: Gateway.Event
    let manager: DiscordManager

    func onInteractionCreate(_ interaction: Interaction) async throws {
        guard case let .applicationCommand(applicationCommand) = interaction.data,
              applicationCommand.name == "add" else {
            return
        }

        try await manager.handleAddCommand(
            interaction: interaction,
            applicationCommand: applicationCommand
        )
    }
}
