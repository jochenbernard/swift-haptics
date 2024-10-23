import Testing
import CoreHaptics

@testable import SwiftHaptics

struct TransientHapticEventTests {
    let transientHapticEvent = TransientHapticEvent(
        time: 2.0,
        intensity: 3.0,
        sharpness: 4.0
    )

    @Test
    func time() {
        #expect(transientHapticEvent.time == 2.0)
    }

    @Test
    func intensity() {
        #expect(transientHapticEvent.intensity == 3.0)
    }

    @Test
    func sharpness() {
        #expect(transientHapticEvent.sharpness == 4.0)
    }

    @Test
    func attackTime() {
        #expect(transientHapticEvent.attackTime == nil)
    }

    @Test
    func decayTime() {
        #expect(transientHapticEvent.decayTime == nil)
    }

    @Test
    func releaseTime() {
        #expect(transientHapticEvent.releaseTime == nil)
    }

    @Test
    func sustained() {
        #expect(transientHapticEvent.sustained == nil)
    }

    @Test
    func coreEvent() {
        let coreEvent = transientHapticEvent.coreEvent
        let expectedCoreEvent = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(
                    parameterID: .hapticIntensity,
                    value: 3.0
                ),
                CHHapticEventParameter(
                    parameterID: .hapticSharpness,
                    value: 4.0
                )
            ],
            relativeTime: 2.0
        )

        #expect(coreEvent.type == expectedCoreEvent.type)
        #expect(coreEvent.eventParameters.map(\.parameterID) == expectedCoreEvent.eventParameters.map(\.parameterID))
        #expect(coreEvent.eventParameters.map(\.value) == expectedCoreEvent.eventParameters.map(\.value))
        #expect(coreEvent.relativeTime == expectedCoreEvent.relativeTime)
        #expect(coreEvent.duration == expectedCoreEvent.duration)
    }
}
