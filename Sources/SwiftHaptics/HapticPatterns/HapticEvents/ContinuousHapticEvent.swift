import CoreHaptics

/// A haptic event with a looped waveform of arbitrary length.
public struct ContinuousHapticEvent: HapticEvent {
    var time: TimeInterval
    var duration: TimeInterval
    var intensity: Double?
    var sharpness: Double?
    var attackTime: TimeInterval?
    var decayTime: TimeInterval?
    var releaseTime: TimeInterval?
    let sustained: Bool?

    /// Creates a continuous haptic event.
    ///
    /// - Parameters:
    ///   - time: The start time of the haptic event, in seconds.
    ///   - duration: The duration of the haptic event, in seconds.
    ///   - intensity: The strength of the haptic event. The default value is
    ///                `nil`.
    ///   - sharpness: The feel of the haptic event. The default value is `nil`.
    ///   - attackTime: The time at which the haptic pattern's intensity begins
    ///                 increasing, in seconds. The default value is `nil`.
    ///   - decayTime: The time at which the haptic pattern's intensity begins
    ///                decreasing, in seconds. The default value is `nil`.
    ///   - releaseTime: The time at which to begin fading the haptic pattern,
    ///                  in seconds. The default value is `nil`.
    ///   - sustained: A Boolean value that indicates whether to sustain the
    ///                haptic event for its specified duration. The default
    ///                value is `nil`.
    public init(
        time: TimeInterval,
        duration: TimeInterval,
        intensity: Double? = nil,
        sharpness: Double? = nil,
        attackTime: TimeInterval? = nil,
        decayTime: TimeInterval? = nil,
        releaseTime: TimeInterval? = nil,
        sustained: Bool? = nil
    ) {
        self.time = time
        self.duration = duration
        self.intensity = intensity
        self.sharpness = sharpness
        self.attackTime = attackTime
        self.decayTime = decayTime
        self.releaseTime = releaseTime
        self.sustained = sustained
    }

    var coreEvent: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: coreParameters,
            relativeTime: time,
            duration: duration
        )
    }
}
