import CoreHaptics

public struct ContinuousHapticEvent: InternalHapticEvent {
    public let time: Double
    public let duration: Double
    public let intensity: Double?
    public let sharpness: Double?
    public let attackTime: Double?
    public let decayTime: Double?
    public let releaseTime: Double?
    public let sustained: Bool?

    var actualDuration: Double {
        duration + (releaseTime ?? .zero)
    }

    public init(
        time: Double,
        duration: Double,
        intensity: Double? = nil,
        sharpness: Double? = nil,
        attackTime: Double? = nil,
        decayTime: Double? = nil,
        releaseTime: Double? = nil,
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

    var event: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: parameters,
            relativeTime: time,
            duration: duration
        )
    }
}
