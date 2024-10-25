import Testing

@testable import SwiftHaptics

struct SpeedHapticPatternModifierTests {
    let speedHapticPatternModifier = SpeedHapticPatternModifier(0.5)

    @Test
    func speed() {
        #expect(speedHapticPatternModifier.speed == 0.5)
    }

    @Test
    func modify() {
        let modified = speedHapticPatternModifier.modify(
            hapticEvents: [
                ContinuousHapticEvent(
                    time: 2.0,
                    duration: 3.0,
                    intensity: 4.0,
                    sharpness: 5.0,
                    attackTime: 6.0,
                    decayTime: 7.0,
                    releaseTime: 8.0,
                    sustained: true
                )
            ]
        )

        #expect(modified.count == 1)

        let hapticEvent = modified[0] as! ContinuousHapticEvent

        #expect(hapticEvent.time == 4.0)
        #expect(hapticEvent.duration == 6.0)
        #expect(hapticEvent.intensity == 4.0)
        #expect(hapticEvent.sharpness == 5.0)
        #expect(hapticEvent.attackTime == 12.0)
        #expect(hapticEvent.decayTime == 14.0)
        #expect(hapticEvent.releaseTime == 16.0)
        #expect(hapticEvent.sustained == true)
    }
}
