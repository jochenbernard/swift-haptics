import CoreHaptics

/// A brief impulse occurring at a specific point in time, like the feedback
/// from toggling a switch.
public struct TransientHapticEvent: HapticEvent {
    var time: Double
    var intensity: Double?
    var sharpness: Double?

    var attackTime: Double? { nil }
    var decayTime: Double? { nil }
    var releaseTime: Double? { nil }
    var sustained: Bool? { nil }

    /// Creates a transient haptic event.
    ///
    /// - Parameters:
    ///   - time: The start time of the haptic event, in seconds.
    ///   - intensity: The strength of the haptic event. The default value is
    ///                `nil`.
    ///   - sharpness: The feel of the haptic event. The default value is `nil`.
    public init(
        time: Double,
        intensity: Double? = nil,
        sharpness: Double? = nil
    ) {
        self.time = time
        self.intensity = intensity
        self.sharpness = sharpness
    }

    var coreEvent: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticTransient,
            parameters: coreParameters,
            relativeTime: time
        )
    }
}
