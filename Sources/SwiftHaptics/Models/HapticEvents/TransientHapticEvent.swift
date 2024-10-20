import CoreHaptics

public struct TransientHapticEvent: InternalHapticEvent {
    public let time: Double

    var event: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [],
            relativeTime: time
        )
    }
}
