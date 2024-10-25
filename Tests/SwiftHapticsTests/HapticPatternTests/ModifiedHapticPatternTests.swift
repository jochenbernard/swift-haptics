import Testing

@testable import SwiftHaptics

struct ModifiedHapticPatternTests {
    let modifiedHapticPattern = ModifiedHapticPattern(
        hapticPattern: MockHapticEvent.mock,
        modifier: MockHapticPatternModifier {
            MockHapticEvent.mock
        }
    )

    @Test
    func hapticPattern() {
        let hapticPattern = modifiedHapticPattern.hapticPattern as! MockHapticEvent
        let expectedHapticPattern = MockHapticEvent.mock

        #expect(hapticPattern == expectedHapticPattern)
    }

    @Test
    func modifier() {
        #expect(type(of: modifiedHapticPattern.modifier) == MockHapticPatternModifier.self)
    }

    @Test
    func baseHapticEvents() {
        let baseHapticEvents = modifiedHapticPattern.baseHapticEvents.map {
            $0 as! MockHapticEvent
        }
        let expectedBaseHapticEvents = [
            MockHapticEvent.mock
        ]

        #expect(baseHapticEvents == expectedBaseHapticEvents)
    }
}
