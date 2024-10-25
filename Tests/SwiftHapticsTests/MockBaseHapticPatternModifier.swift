@testable import SwiftHaptics

struct MockBaseHapticPatternModifier: BaseHapticPatternModifier {
    let hapticEvents: [HapticEvent]

    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent] {
        hapticEvents
    }
}
