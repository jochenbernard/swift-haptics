import Testing
import CoreHaptics

@testable import SwiftHaptics

struct HapticPatternTests {
    let hapticPattern = MockHapticPattern {
        MockHapticEvent.mock
    }

    @Test
    func modifier() {
        let modifier = hapticPattern.modifier(
            MockHapticPatternModifier {
                MockHapticEvent.mock
            }
        ) as! ModifiedHapticPattern

        #expect(type(of: modifier.hapticPattern) == MockHapticPattern.self)
        #expect(type(of: modifier.modifier) == MockHapticPatternModifier.self)
    }

    @Test
    func hapticEvents() {
        let hapticEvents = hapticPattern.hapticEvents.map {
            $0 as! MockHapticEvent
        }
        let expectedHapticEvents = [
            MockHapticEvent.mock
        ]

        #expect(hapticEvents == expectedHapticEvents)
    }

    @Test
    func corePattern() throws {
        let corePattern = try hapticPattern.corePattern
        let expectedCorePattern = try CHHapticPattern(
            events: hapticPattern.hapticEvents.map(\.coreEvent),
            parameters: []
        )

        #expect(try corePattern.testable == expectedCorePattern.testable)
    }
}
