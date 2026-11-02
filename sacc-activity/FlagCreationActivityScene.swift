//
//  FlagCreationActivityScene.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 15/11/23.
//

import Foundation
import SwiftUI

struct FlagCreationActivityScene: ActivityScene {
    
    var systemName = "flag.filled.and.flag.crossed"
    var title = "Group Flag"
    
    var body: some View {
        EmptyView()
    }
    
    var scenes: [ActivitySubscene] = [
        ActivitySubscene(systemImage: "hand.wave",
                         title: "Activity Intro",
                         state: .activityTitle("Fantastic Fluttering Flags", "activity 1")),
//        ActivitySubscene(systemImage: "person.3",
//                         title: "Groups",
//                         state: .image(.groups)),
        ActivitySubscene(systemImage: "list.clipboard",
                         title: "Brief",
                         state: .pointers([
                            Pointer(systemName: "bubble.left.and.text.bubble.right.fill",
                                    title: "Discuss",
                                    color: .mint,
                                    subtitle: "Talk to your teammates!"),
                            Pointer(systemName: "paintpalette.fill",
                                    title: "Design",
                                    color: .teal,
                                    subtitle: "Use _any_ design tool, Keynote, Canva, Figma, etc., and even pen and paper!"),
                            Pointer(systemName: "square.and.arrow.up",
                                    title: "Upload",
                                    color: .cyan,
                                    subtitle: "Use `/flag` in your group text channel")
                         ])),
        ActivitySubscene(systemImage: "timer", title: "Activity Timer",
                         state: .timer(.init(content: .pointers([
                            Pointer(systemName: "mic.fill",
                                    title: "Talk",
                                    color: .mint,
                                    subtitle: "Use your group‘s voice channel on Discord!"),
                            Pointer(systemName: "paintpalette.fill",
                                    title: "Design",
                                    color: .teal,
                                    subtitle: "Use _any_ design tool, Keynote, Canva, Figma, etc., and even pen and paper!"),
                            Pointer(systemName: "square.and.arrow.up",
                                    title: "Upload",
                                    color: .cyan,
                                    subtitle: "Use `/flag` in your group text channel")
                         ]), endDate: .init(timeIntervalSince1970: 1773626400))),
                         onStart: { discordManager in
                             discordManager.activeSlashCommand = "flag"
                         }, onEnd: { discordManager in
                             discordManager.activeSlashCommand = nil
                         }),
        ActivitySubscene(systemImage: "eyes", title: "Review", state: .submissions("flag")),
        ActivitySubscene(systemImage: "flag.filled.and.flag.crossed", title: "Leaderboard", state: .leaderboards)
    ]
}
