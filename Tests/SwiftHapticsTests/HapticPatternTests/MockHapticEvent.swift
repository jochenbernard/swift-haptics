import CoreHaptics

@testable import SwiftHaptics

struct MockHapticEvent: HapticEvent, Equatable {
    var time: Double
    var intensity: Double?
    var sharpness: Double?
    let attackTime: Double?
    let decayTime: Double?
    let releaseTime: Double?
    let sustained: Bool?

    var coreEvent: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticTransient,
            parameters: coreParameters,
            relativeTime: time
        )
    }
}
