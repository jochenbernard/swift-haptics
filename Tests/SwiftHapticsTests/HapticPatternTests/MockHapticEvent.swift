import CoreHaptics

@testable import SwiftHaptics

struct MockHapticEvent: HapticEvent, Equatable {
    var time: TimeInterval
    var intensity: Double?
    var sharpness: Double?
    let attackTime: TimeInterval?
    let decayTime: TimeInterval?
    let releaseTime: TimeInterval?
    let sustained: Bool?

    var coreEvent: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticTransient,
            parameters: coreParameters,
            relativeTime: time
        )
    }

    static var mock: MockHapticEvent {
        MockHapticEvent(
            time: 2.0,
            intensity: 3.0,
            sharpness: 4.0,
            attackTime: 5.0,
            decayTime: 6.0,
            releaseTime: 7.0,
            sustained: true
        )
    }
}
