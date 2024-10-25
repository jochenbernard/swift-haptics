import Testing

@testable import SwiftHaptics

struct HapticPatternListTests {
    let hapticPatternList = HapticPatternList(
        patterns: [
            MockHapticEvent.mock
        ]
    )

    @Test
    func patterns() {
        let patterns = hapticPatternList.patterns.map {
            $0 as! MockHapticEvent
        }
        let expectedPatterns = [
            MockHapticEvent.mock
        ]

        #expect(patterns == expectedPatterns)
    }

    @Test
    func baseHapticEvents() {
        let baseHapticEvents = hapticPatternList.baseHapticEvents.map {
            $0 as! MockHapticEvent
        }
        let expectedBaseHapticEvents = [
            MockHapticEvent.mock
        ]

        #expect(baseHapticEvents == expectedBaseHapticEvents)
    }
}
