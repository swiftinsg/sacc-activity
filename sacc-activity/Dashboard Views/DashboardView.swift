import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var discordManager: DiscordManager
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        NavigationStack {
            AddPointsView(groups: $discordManager.activityGroups)
                .navigationTitle("Dashboard")
                .toolbar {
                    Button("Show Leaderboard") {
                        openWindow(id: "am-leaderboard")
                        openWindow(id: "pm-leaderboard")
                    }
                }
        }
        .frame(minWidth: 700, minHeight: 600)
    }
}

#Preview {
    DashboardView()
        .environmentObject(DiscordManager())
}
