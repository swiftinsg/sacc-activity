//
//  TriviaActivityScene.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 15/11/23.
//

import Foundation
import SwiftUI

struct TriviaActivityScene: ActivityScene {
    var systemName = "questionmark.bubble"
    var title = "Terribly Tricky Trivia"
    
    var body: some View {
        EmptyView()
    }
    
    var scenes: [ActivitySubscene] = [
        [
            ActivitySubscene(systemImage: "hand.wave",
                             title: "Activity Intro",
                             state: .activityTitle("Terribly Tricky Trivia", "activity 3")),
            ActivitySubscene(systemImage: "list.clipboard",
                             title: "Briefing",
                             state: .pointers([
                                Pointer(systemName: "person.fill.questionmark", title: "Answer Questions", color: .yellow, subtitle: "There are 15 trivia questions, you can discuss in your voice channels."),
                                Pointer(systemName: "timer", title: "Clock’s Ticking!", color: .orange, subtitle: "Questions will either have 45 seconds, 1 minute, or 2 minutes for you to answer!"),
                                Pointer(systemName: "scope", title: "Accuracy First", color: .red, subtitle: "It’s not about speed, it’s accuracy. Points are awarded based on the closest to the actual answer."),
                                Pointer(systemName: "command", title: "Slash Commands!", color: .purple, subtitle: "We’ll use slash commands like `/q1` to `/q15` for this.")
                             ])),
            ActivitySubscene(systemImage: "flag.filled.and.flag.crossed", title: "Leaderboard", state: .leaderboards),
        ],
        [
            ActivitySubscene(systemImage: "1.circle", title: "Q1: Apple logo",
                             state: .trivia(60, "What fruit inspired the Apple logo?", 1, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q1"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "1.square", title: "Q1 Answer", state: .statement("**Pear**, no but seriously, it's Apple")),
            ActivitySubscene(systemImage: "1.circle.fill", title: "Q1 Review", state: .submissions("q1")),
        ],
        [
            ActivitySubscene(systemImage: "2.circle", title: "Q2: Apple50",
                             state: .trivia(45, "When was Apple founded?", 2, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q2"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "2.square", title: "Q2 Answer", state: .statement("April 1st, 1976")),
            ActivitySubscene(systemImage: "2.circle.fill", title: "Q2 Review", state: .submissions("q2")),
        ],
        [
            ActivitySubscene(systemImage: "3.circle", title: "Q3: First WWDC",
                             state: .trivia(45, "Which year was the first WWDC held?", 3, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q3"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "3.square", title: "Q3 Answer", state: .statement("1983")),
            ActivitySubscene(systemImage: "3.circle.fill", title: "Q3 Review", state: .submissions("q3")),
        ],
        [
            ActivitySubscene(systemImage: "4.circle", title: "Q4: SwiftUI Release",
                             state: .trivia(45, "Which year was SwiftUI released?", 4, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q4"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "4.square", title: "Q4 Answer", state: .statement("2019")),
            ActivitySubscene(systemImage: "4.circle.fill", title: "Q4 Review", state: .submissions("q4")),
        ],
        [
            ActivitySubscene(systemImage: "5.circle", title: "Q5: Beginning of Swift Accelerator",
                             state: .trivia(45, "What year did Swift Accelerator start?", 5, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q5"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "5.square", title: "Q5 Answer", state: .statement("2018")),
            ActivitySubscene(systemImage: "5.circle.fill", title: "Q5 Review", state: .submissions("q5")),
        ],
        [
            ActivitySubscene(systemImage: "6.circle", title: "Q6: SSC Winners",
                             state: .trivia(45, "How many Swift Student Challenge wins have come out of this programme?", 6, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q6"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "6.square", title: "Q6 Answer", state: .statement("18")),
            ActivitySubscene(systemImage: "6.circle.fill", title: "Q6 Review", state: .submissions("q6")),
        ],
        [
            ActivitySubscene(systemImage: "7.circle", title: "Q7: Tim Cook",
                             state: .trivia(45, "Which year did Tim Cook come to Swift Accelerator? Type 0 if he never came.", 7, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q7"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "7.square", title: "Q7 Answer", state: .statement("2019")),
            ActivitySubscene(systemImage: "7.circle.fill", title: "Q7 Review", state: .submissions("q7")),
        ],
        [
            ActivitySubscene(systemImage: "8.circle", title: "Q8: New Color",
                             state: .trivia(45, "What new colour did Apple debut on the latest Macbook release?", 8, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q8"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "8.square", title: "Q8 Answer", state: .statement("Citrus")),
            ActivitySubscene(systemImage: "8.circle.fill", title: "Q8 Review", state: .submissions("q8")),
        ],
        [
            ActivitySubscene(systemImage: "9.circle", title: "Q9: GeoGusser SG",
                             state: .trivia(120, "Where was this picture taken? Submit the lat and long.", 9, .SG),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q9"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "9.square", title: "Q9 Answer", state: .statement("1.305800, 103.904861")),
            ActivitySubscene(systemImage: "9.circle.fill", title: "Q9 Review", state: .submissions("q9")),
        ],
        [
            ActivitySubscene(systemImage: "10.circle", title: "Q10: Pizza",
                             state: .trivia(45, "How many pizzas did we order for lunch?", 10, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q10"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "10.square", title: "Q10 Answer", state: .statement("30")),
            ActivitySubscene(systemImage: "10.circle.fill", title: "Q10 Review", state: .submissions("q10")),
        ],
        [
            ActivitySubscene(systemImage: "11.circle", title: "Q11: Grammy",
                             state: .trivia(45, "What is the song that won Swift her first grammy?", 11, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q11"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "11.square", title: "Q11 Answer", state: .statement("White Horse")),
            ActivitySubscene(systemImage: "11.circle.fill", title: "Q11 Review", state: .submissions("q11")),
        ],
        [
            ActivitySubscene(systemImage: "12.circle", title: "Q12: Swift Swift",
                             state: .trivia(45, "What is the engine capacity of the latest Swift? (in cc)?", 12, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q12"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "12.square", title: "Q12 Answer", state: .statement("1197")),
            ActivitySubscene(systemImage: "12.circle.fill", title: "Q12 Review", state: .submissions("q12")),
        ],
        [
            ActivitySubscene(systemImage: "13.circle", title: "Q13: Lucky Number",
                             state: .trivia(45, "What is Swift's lucky number?", 13, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q13"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "13.square", title: "Q13 Answer", state: .statement("13")),
            ActivitySubscene(systemImage: "13.circle.fill", title: "Q13 Review", state: .submissions("q13")),
        ],
        [
            ActivitySubscene(systemImage: "14.circle", title: "Q14: DBS SWIFT Code",
                             state: .trivia(45, "What is the SWIFT code for DBS?", 14, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q14"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "14.square", title: "Q14 Answer", state: .statement("DBSSSGSG")),
            ActivitySubscene(systemImage: "14.circle.fill", title: "Q14 Review", state: .submissions("q14")),
        ],
        [
            ActivitySubscene(systemImage: "15.circle", title: "Q15: Swift Bird",
                             state: .trivia(45, "What is the genus of a common swift?", 15, nil),
                             onStart: { discordManager in
                                 discordManager.activeSlashCommand = "q15"
                             }, onEnd: { discordManager in
                                 discordManager.activeSlashCommand = nil
                             }),
            ActivitySubscene(systemImage: "15.square", title: "Q15 Answer", state: .statement("*Apus*")),
            ActivitySubscene(systemImage: "15.circle.fill", title: "Q15 Review", state: .submissions("q15")),
        ]
    ].flatMap {
        $0
    }
}
