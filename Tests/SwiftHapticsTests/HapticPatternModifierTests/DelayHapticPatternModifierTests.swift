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
        let modified = delayHapticPatternModifier.modify(
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

        #expect(modified.count == 1)

        let hapticEvent = modified[0] as! MockHapticEvent

        #expect(hapticEvent.time == 2.5)
        #expect(hapticEvent.intensity == 3.0)
        #expect(hapticEvent.sharpness == 4.0)
        #expect(hapticEvent.attackTime == 5.0)
        #expect(hapticEvent.decayTime == 6.0)
        #expect(hapticEvent.releaseTime == 7.0)
        #expect(hapticEvent.sustained == true)
    }
}
