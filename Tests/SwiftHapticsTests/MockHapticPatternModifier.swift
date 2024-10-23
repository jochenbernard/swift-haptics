@testable import SwiftHaptics

struct MockHapticPatternModifier: HapticPatternModifier {
    func pattern(pattern: HapticPattern) -> HapticPattern {
        MockHapticPattern()
    }
}
