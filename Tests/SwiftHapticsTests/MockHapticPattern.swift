@testable import SwiftHaptics

struct MockHapticPattern: HapticPattern {
    private let hapticPattern: () -> HapticPattern

    init(@HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern) {
        self.hapticPattern = hapticPattern
    }

    var pattern: HapticPattern {
        hapticPattern()
    }
}
