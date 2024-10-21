import CoreHaptics

public struct TransientHapticEvent: HapticEvent {
    var time: Double
    var intensity: Double?
    var sharpness: Double?

    var attackTime: Double? { nil }
    var decayTime: Double? { nil }
    var releaseTime: Double? { nil }
    var sustained: Bool? { nil }

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
