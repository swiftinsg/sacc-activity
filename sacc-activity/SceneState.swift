//
//  SceneState.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 15/11/23.
//

import Foundation
import SwiftUI

enum SceneState {
    
    case empty
    
    // Presentation
    case activityTitle(String, String)
    
    // +------------------+
    // |                  |
    // | text1 (title)    |
    // | text2 (subtitle) |
    // |                  |
    // +------------------+
    case section(String, String)
    
    // +------------------+
    // |                  |
    // | icon  icon  icon |
    // | text  text  text |
    // |                  |
    // +------------------+
    case pointers([Pointer])
    
    // +------------------+
    // |                  |
    // |       text       |
    // |                  |
    // |                  |
    // +------------------+
    case statement(String)
    
    case timer(TimerInput)
    
    // title, image, completion date
    case trivia(TimeInterval, String, Int, NSImage?)

    // display 50 random words
    case words
    
    // A Padlet board style screen
    case submissions(String)
    
    case leaderboards
    case image(NSImage)
}

enum TimerContent {
    case wordsList
    case pointers([Pointer])
}

struct TimerInput {
    var content: TimerContent
    var startDate: Date?
    var endDate: Date
}

struct ActivitySubscene: Identifiable {
    var id = UUID()
    var systemImage: String
    var title: String
    var state: SceneState
    var onStart: ((DiscordManager) -> Void)?
    var onEnd: ((DiscordManager) -> Void)?
}

struct Submission {
    var activity: String
    
    var activityGroup: ActivityGroup
    
    var contents: SubmissionType
    
    enum SubmissionType {
        case flag
        case text(String)
        case triviaSubmission(String, String)
        case triviaMap((Double, Double), String)
    }
}

struct ActivityGroup: Identifiable {
    var id: String { groupId }

    let groupId: String
    var groupName: String
    var flagURL: URL?

    var points = 0
}

struct Pointer {
    var systemName: String
    var title: String
    var color: Color
    var subtitle: String = ""
}
