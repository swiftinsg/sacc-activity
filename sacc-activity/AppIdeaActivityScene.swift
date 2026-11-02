//
//  AppIdeaActivityScene.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 15/11/23.
//

import Foundation
import SwiftUI

struct AppIdeaActivityScene: ActivityScene {
    
    var systemName = "book"
    var title = "Swift Story Scribbling"
    
    var body: some View {
        EmptyView()
    }
    
    var scenes: [ActivitySubscene] = [
        ActivitySubscene(systemImage: "hand.wave",
                         title: "Activity Intro",
                         state: .activityTitle("Swift Story Scribbling", "activity 2")),
        ActivitySubscene(systemImage: "text.book.closed",
                         title: "Brief: BS",
                         state: .statement("Part of presenting a good app idea is storytelling.")),
        ActivitySubscene(systemImage: "doc.append",
                         title: "Brief: Story",
                         state: .statement("As a group, you have to write a story.")),
//        ActivitySubscene(systemImage: "doc.append",
//                         title: "Brief: Full Brief",
//                         state: .statement("The story should contain all of your team members' names and as many Taylor Swift song titles as possible.")),
        ActivitySubscene(systemImage: "list.clipboard",
                         title: "Brief",
                         state: .pointers([
                            Pointer(systemName: "bubble.left.and.text.bubble.right.fill",
                                    title: "Discuss",
                                    color: .red,
                                    subtitle: "Talk to your teammates!"),
                            Pointer(systemName: "paintpalette.fill",
                                    title: "Write",
                                    color: .orange,
                                    subtitle: "Write a story containing all your team member's names and as many Taylor Swift song titles as possible."),
                            Pointer(systemName: "square.and.arrow.up",
                                    title: "Share",
                                    color: .yellow,
                                    subtitle: "Use `/story` in your group text channel")
                         ])),
        ActivitySubscene(systemImage: "medal",
                         title: "Brief: Prizes",
                         state: .pointers([
                            Pointer(systemName: "medal.fill", title: "Most Taylor Swift song titles", color: .yellow),
                            Pointer(systemName: "medal.fill", title: "Best Story", color: .orange, subtitle: "Judged by an unbiased group of alumni")
                         ])),
        ActivitySubscene(systemImage: "text.alignleft",
                         title: "Example Story",
                         state: .statement("Never in Bryan's *wildest dreams* did he ever imagine he would be the main trainer of Swift Accelerator, it was a *cruel summer* when YJ and Jia Chen were crossing *Cornelia Street* and was hit by a bus. They met their *end game.* Since that day, *everything has changed,* Bryan became the main trainer, and he has been *haunted* by it ever since. When it happened, he was not _...ready for it_, but he has learned to embrace the _change_. He will _forever & always_ be the main trainer of the programme until he gets hit by another bus. That is _the story of us_.")),
        ActivitySubscene(systemImage: "timer", title: "Activity Timer",
                         state: .timer(TimerInput(content: .pointers([
                            Pointer(systemName: "bubble.left.and.text.bubble.right.fill",
                                    title: "Discuss",
                                    color: .red,
                                    subtitle: "Talk to your teammates!"),
                            Pointer(systemName: "paintpalette.fill",
                                    title: "Write",
                                    color: .orange,
                                    subtitle: "Write a story containing all your team member's names and as many Taylor Swift song titles as possible."),
                            Pointer(systemName: "square.and.arrow.up",
                                    title: "Share",
                                    color: .yellow,
                                    subtitle: "Use `/story` in your group text channel")
                         ]), endDate: .init(timeIntervalSince1970: 1773626400))),
                         onStart: { discordManager in
                             discordManager.activeSlashCommand = "story"
                         }, onEnd: { discordManager in
                             discordManager.activeSlashCommand = nil
                         }),
        ActivitySubscene(systemImage: "eyes", title: "Review", state: .submissions("idea")),
        ActivitySubscene(systemImage: "flag.filled.and.flag.crossed", title: "Leaderboard", state: .leaderboards),
        ActivitySubscene(systemImage: "heart", title: "Alumni Best (43 songs)", state: .statement("Never in Tristan's *Wildest Dreams* did he ever imagine it would happen. It was *the last great american dynasty.* the year *seven* thousand. Jia Chen had to fly all the way to *Paris* on *New Year’s day* for the first Swift Accelerator class. Jia Chen was the *mastermind* of the new and improved class after *the man* *haunted* the old classes, which caused *the great war.* Although the scene wasn’t *gorgeous,* a *glitch* caused Jia Chen to be able to escape via a *getaway car.* Ever since then, he kept his *eyes open* and lived in *exile.* However, *everything has changed,* and he realised he was a *foolish one* for running away. He became *fearless* when he realised that *the great war* was a *hoax.* Thus, he went to the *holy ground* where he met a seer called *betty* the *Mad Woman,* who said *“I Know Places* to host the new classes”. She then passed him *the manuscript* to get there. Jia Chen took *the manuscript* and became the *mastermind* of a plan to get there. Following this, he wrote his entire experience on a *message in a bottle* so that people will find out about his adventure in the future, all while experiencing *midnight rain.* “this future will be *ours!* I am *ready for it!”* he exclaimed. He realised that the road led to *Paris,* *Out of the woods,* at *a place in this world,* and so he proceeded to *run* for 9 months, until September, with *snow on the beach.* He wanted to give up, but he remembered Betty’s words saying *“soon you’ll get better”,* so he styled himself up to be *superman* and went to *wonderland.* Alas, *you’ll always find your way back home,* and *the man* got his *karma,* and everything went well from then on. New Swift Accelerator classes are held in *Paris* now, with *the joker and the queen.* The End."))
    ]
}
