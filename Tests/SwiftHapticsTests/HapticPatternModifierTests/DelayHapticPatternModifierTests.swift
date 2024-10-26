import Testing

@testable import SwiftHaptics

struct DelayHapticPatternModifierTests {
    let delayHapticPatternModifier = DelayHapticPatternModifier(0.5)

    @Test
    func delay() {
        #expect(delayHapticPatternModifier.delay == 0.5)
    }

    @Test
    func modify() {
        let hapticEvents = delayHapticPatternModifier.modify(
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
                time: 2.5,
                intensity: 3.0,
                sharpness: 4.0,
                attackTime: 5.0,
                decayTime: 6.0,
                releaseTime: 7.0,
                sustained: true
            )
        ]

        #expect(hapticEvents == expectedHapticEvents)
    }
}
