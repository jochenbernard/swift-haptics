import Testing

@testable import SwiftHaptics

struct MutedHapticPatternModifierTests {
    let mutedHapticPatternModifier = MutedHapticPatternModifier(true)

    @Test
    func muted() {
        #expect(mutedHapticPatternModifier.muted == true)
    }

    @Test
    func modify() {
        let hapticEvents = mutedHapticPatternModifier.modify(
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
                intensity: 0.0,
                sharpness: 0.0,
                attackTime: 5.0,
                decayTime: 6.0,
                releaseTime: 7.0,
                sustained: true
            )
        ]

        #expect(hapticEvents == expectedHapticEvents)
    }
}
