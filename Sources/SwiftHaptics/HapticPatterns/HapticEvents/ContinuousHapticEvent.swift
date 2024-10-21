import CoreHaptics

public struct ContinuousHapticEvent: HapticEvent {
    var time: Double
    let duration: Double
    let intensity: Double?
    let sharpness: Double?
    let attackTime: Double?
    let decayTime: Double?
    let releaseTime: Double?
    let sustained: Bool?

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

    var coreEvent: CHHapticEvent {
        CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: coreParameters,
            relativeTime: time,
            duration: duration
        )
    }
}
