import CoreHaptics

public struct TransientHapticEvent: HapticEvent {
    public let time: Double
    public let intensity: Double?
    public let sharpness: Double?

    var attackTime: Double? { nil }
    var decayTime: Double? { nil }
    var releaseTime: Double? { nil }
    var sustained: Bool? { nil }

    init(
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
