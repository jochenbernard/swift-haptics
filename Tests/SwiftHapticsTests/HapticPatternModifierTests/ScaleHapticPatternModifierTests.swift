import Testing

@testable import SwiftHaptics

struct ScaleHapticPatternModifierTests {
    let scaleHapticPatternModifier = ScaleHapticPatternModifier(
        intensity: 0.5,
        sharpness: 0.75
    )

    @Test
    func intensityScale() {
        #expect(scaleHapticPatternModifier.intensityScale == 0.5)
    }

    @Test
    func sharpnessScale() {
        #expect(scaleHapticPatternModifier.sharpnessScale == 0.75)
    }

    @Test
    func modify() {
        let hapticEvents = scaleHapticPatternModifier.modify(
            hapticEvents: [
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
        )
        .map {
            $0 as! MockHapticEvent
        }
        let expectedHapticEvents = [
            MockHapticEvent(
                time: 2.0,
                intensity: 1.5,
                sharpness: 3.0,
                attackTime: 5.0,
                decayTime: 6.0,
                releaseTime: 7.0,
                sustained: true
            )
        ]

        #expect(hapticEvents == expectedHapticEvents)
    }
}
