import DiscordBM

extension DiscordManager {
    private static let addCommandRoleID = "1480917515923226635"

    func setUpSlashCommands() async {
        let groupChoices = groupNames.map {
            ApplicationCommand.Option.Choice(
                name: $0.name,
                value: .string($0.groupId)
            )
        }

        let addCommand = Payloads.ApplicationCommandCreate(
            name: "add",
            description: "Add 100 points to a group.",
            options: [
                .init(
                    type: .string,
                    name: "group",
                    description: "Select a group.",
                    required: true,
                    choices: groupChoices
                )
            ],
            dm_permission: false
        )

        do {
            try await bot?.client.bulkSetApplicationCommands(
                payload: []
            ).guardSuccess()

            try await bot?.client.bulkSetGuildApplicationCommands(
                guildId: .init(stringLiteral: discordInfo.guildId),
                payload: [addCommand]
            ).guardSuccess()
        } catch {
            print("Unable to register /add as the only slash command: \(error)")
        }
    }

    func handleAddCommand(
        interaction: Interaction,
        applicationCommand: Interaction.ApplicationCommand
    ) async throws {
        let requiredRole: RoleSnowflake = .init(stringLiteral: Self.addCommandRoleID)

        guard interaction.member?.roles.contains(requiredRole) == true else {
            try await respond(
                to: interaction,
                with: "You do not have permission to use this command.",
                ephemeral: true
            )
            return
        }

        guard let groupId = try? applicationCommand.options?.first?.requireString(),
              groupNames.contains(where: { $0.groupId == groupId }),
              let groupIndex = activityGroups.firstIndex(where: { $0.groupId == groupId }) else {
            try await respond(
                to: interaction,
                with: "Please select a valid group.",
                ephemeral: true
            )
            return
        }

        await MainActor.run {
            activityGroups[groupIndex].points += 100
        }

        let groupName = activityGroups[groupIndex].groupName
        try await respond(
            to: interaction,
            with: "Added 100 points to **\(groupName)**.",
            ephemeral: false
        )
    }

    private func respond(
        to interaction: Interaction,
        with message: String,
        ephemeral: Bool
    ) async throws {
        try await bot?.client.createInteractionResponse(
            id: interaction.id,
            token: interaction.token,
            payload: .channelMessageWithSource(
                .init(
                    content: message,
                    flags: ephemeral ? [.ephemeral] : nil
                )
            )
        ).guardSuccess()
    }
}
