import CoreHaptics

public struct ContinuousHapticEvent: InternalHapticEvent {
    public let time: Double
    public let duration: Double

    var event: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [],
            relativeTime: time,
            duration: duration
        )
    }
}
