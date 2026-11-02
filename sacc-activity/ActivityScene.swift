import SwiftUI

protocol ActivityScene: View, Identifiable {
    var systemName: String { get }
    var title: String { get }

    var scenes: [ActivitySubscene] { get set }
}

extension ActivityScene {
    var id: String { title }
    var scenes: [ActivitySubscene] {
        get { [] }
        set {}
    }
}
