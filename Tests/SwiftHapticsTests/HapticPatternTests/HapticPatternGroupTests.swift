import Testing

@testable import SwiftHaptics

struct HapticPatternGroupTests {
    let hapticPatternGroup = HapticPatternGroup {
        MockHapticEvent.mock
    }

    @Test
    func hapticPattern() {
        let hapticPattern = hapticPatternGroup.hapticPattern() as! MockHapticEvent
        let expectedHapticPattern = MockHapticEvent.mock

        #expect(hapticPattern == expectedHapticPattern)
    }

    @Test
    func pattern() {
        let pattern = hapticPatternGroup.pattern as! MockHapticEvent
        let expectedPattern = MockHapticEvent.mock

        #expect(pattern == expectedPattern)
    }
}
