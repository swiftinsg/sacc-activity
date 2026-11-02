//
//  sacc_activityApp.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 13/11/23.
//

import SwiftUI

@main
struct sacc_activityApp: App {
    @StateObject private var discordManager = DiscordManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .preferredColorScheme(.dark)
                .environmentObject(discordManager)
        }

        WindowGroup(id: "am-leaderboard") {
            FlagRaisingLeaderboardPresentationView(groupRange: .am)
                .preferredColorScheme(.dark)
                .environmentObject(discordManager)
        }
        
        WindowGroup(id: "pm-leaderboard") {
            FlagRaisingLeaderboardPresentationView(groupRange: .pm)
                .preferredColorScheme(.dark)
                .environmentObject(discordManager)
        }
    }
}
