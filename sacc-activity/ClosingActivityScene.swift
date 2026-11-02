//
//  ClosingActivityScene.swift
//  sacc-activity
//
//  Created by Jia Chen Yee on 18/11/23.
//

import Foundation
import SwiftUI

struct ClosingActivityScene: ActivityScene {
    var systemName = "flag"
    var title = "Closing"
    
    var body: some View {
        EmptyView()
    }
    
    var scenes: [ActivitySubscene] = [
        ActivitySubscene(systemImage: "flag", title: "Closing", state: .statement("We hope you had fun!")),
        ActivitySubscene(systemImage: "1.circle", title: "One more thing", state: .statement("One more thing…")),
        ActivitySubscene(systemImage: "hammer", title: "Xcode lol", state: .statement("Everything you’ve seen is written entirely in Swift & SwiftUI.")),
        ActivitySubscene(systemImage: "flag", title: "Thank You", state: .statement("Thank you."))
    ]
}
