import Testing

@testable import SwiftHaptics

struct EmptyHapticPatternTests {
    let emptyHapticPattern = EmptyHapticPattern()

    @Test
    func baseHapticEvents() {
        #expect(emptyHapticPattern.baseHapticEvents.isEmpty)
    }
}
