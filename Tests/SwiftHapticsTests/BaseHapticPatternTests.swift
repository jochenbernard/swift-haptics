import Testing

@testable import SwiftHaptics

struct BaseHapticPatternTests {
    let baseHapticPattern = MockBaseHapticPattern(
        baseHapticEvents: [
            MockHapticEvent.mock
        ]
    )

    @Test
    func pattern() {
        #expect(type(of: baseHapticPattern.pattern) == EmptyHapticPattern.self)
    }
}
