import Testing

@testable import SwiftHaptics

struct BaseHapticPatternModifierTests {
    let baseHapticPatternModifier = MockBaseHapticPatternModifier(
        hapticEvents: [MockHapticEvent.mock]
    )

    @Test
    func pattern() {
        let pattern = baseHapticPatternModifier.pattern(
            pattern: MockHapticEvent.mock
        )

        #expect(type(of: pattern) == EmptyHapticPattern.self)
    }
}
