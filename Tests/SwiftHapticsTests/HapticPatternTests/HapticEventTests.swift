import Testing
import CoreHaptics

@testable import SwiftHaptics

struct HapticEventTests {
    let hapticEvent = MockHapticEvent(
        time: 2.0,
        intensity: 3.0,
        sharpness: 4.0,
        attackTime: 5.0,
        decayTime: 6.0,
        releaseTime: 7.0,
        sustained: true
    )

    @Test
    func baseHapticEvents() {
        let baseHapticEvents = hapticEvent.baseHapticEvents.map {
            $0 as! MockHapticEvent
        }
        let expectedBaseHapticEvents = [
            MockHapticEvent(
                time: 2.0,
                intensity: 3.0,
                sharpness: 4.0,
                attackTime: 5.0,
                decayTime: 6.0,
                releaseTime: 7.0,
                sustained: true
            )
        ]

        #expect(baseHapticEvents == expectedBaseHapticEvents)
    }

    @Test
    func coreParameters() {
        let coreParameters = hapticEvent.coreParameters
        let expectedCoreParameters = [
            CHHapticEventParameter(
                parameterID: .hapticIntensity,
                value: 3.0
            ),
            CHHapticEventParameter(
                parameterID: .hapticSharpness,
                value: 4.0
            ),
            CHHapticEventParameter(
                parameterID: .attackTime,
                value: 5.0
            ),
            CHHapticEventParameter(
                parameterID: .decayTime,
                value: 6.0
            ),
            CHHapticEventParameter(
                parameterID: .releaseTime,
                value: 7.0
            ),
            CHHapticEventParameter(
                parameterID: .sustained,
                value: 1.0
            )
        ]

        #expect(coreParameters.map(\.testable) == expectedCoreParameters.map(\.testable))
    }
}
