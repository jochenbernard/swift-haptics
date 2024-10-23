@testable import SwiftHaptics

struct MockBaseHapticPattern: BaseHapticPattern {
    var baseHapticEvents: [HapticEvent] {
        []
    }
}
