import Testing
import CoreHaptics

@testable import SwiftHaptics

struct ContinuousHapticEventTests {
    let continuousHapticEvent = ContinuousHapticEvent(
        time: 2.0,
        duration: 3.0,
        intensity: 4.0,
        sharpness: 5.0,
        attackTime: 6.0,
        decayTime: 7.0,
        releaseTime: 8.0,
        sustained: true
    )

    @Test
    func time() {
        #expect(continuousHapticEvent.time == 2.0)
    }

    @Test
    func duration() {
        #expect(continuousHapticEvent.duration == 3.0)
    }

    @Test
    func intensity() {
        #expect(continuousHapticEvent.intensity == 4.0)
    }

    @Test
    func sharpness() {
        #expect(continuousHapticEvent.sharpness == 5.0)
    }

    @Test
    func attackTime() {
        #expect(continuousHapticEvent.attackTime == 6.0)
    }

    @Test
    func decayTime() {
        #expect(continuousHapticEvent.decayTime == 7.0)
    }

    @Test
    func releaseTime() {
        #expect(continuousHapticEvent.releaseTime == 8.0)
    }

    @Test
    func sustained() {
        #expect(continuousHapticEvent.sustained == true)
    }

    @Test
    func coreEvent() {
        let coreEvent = continuousHapticEvent.coreEvent
        let expectedCoreEvent = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(
                    parameterID: .hapticIntensity,
                    value: 4.0
                ),
                CHHapticEventParameter(
                    parameterID: .hapticSharpness,
                    value: 5.0
                ),
                CHHapticEventParameter(
                    parameterID: .attackTime,
                    value: 6.0
                ),
                CHHapticEventParameter(
                    parameterID: .decayTime,
                    value: 7.0
                ),
                CHHapticEventParameter(
                    parameterID: .releaseTime,
                    value: 8.0
                ),
                CHHapticEventParameter(
                    parameterID: .sustained,
                    value: 1.0
                )
            ],
            relativeTime: 2.0,
            duration: 3.0
        )

        #expect(coreEvent.type == expectedCoreEvent.type)
        #expect(coreEvent.eventParameters.map(\.parameterID) == expectedCoreEvent.eventParameters.map(\.parameterID))
        #expect(coreEvent.eventParameters.map(\.value) == expectedCoreEvent.eventParameters.map(\.value))
        #expect(coreEvent.relativeTime == expectedCoreEvent.relativeTime)
        #expect(coreEvent.duration == expectedCoreEvent.duration)
    }
}
