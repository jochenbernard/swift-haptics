@testable import SwiftHaptics

struct MockHapticPatternModifier: HapticPatternModifier {
    private let hapticPattern: () -> HapticPattern

    init(@HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern) {
        self.hapticPattern = hapticPattern
    }

    func pattern(pattern: HapticPattern) -> HapticPattern {
        hapticPattern()
    }
}
