struct SpeedHapticPatternModifier: BaseHapticPatternModifier {
    let speed: Double

    init(_ speed: Double) {
        self.speed = speed
    }

    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent] {
        hapticEvents.map {
            var hapticEvent = $0
            hapticEvent.time /= speed
            if var continuousHapticEvent = hapticEvent as? ContinuousHapticEvent {
                continuousHapticEvent.duration /= speed
                if let attackTime = continuousHapticEvent.attackTime {
                    continuousHapticEvent.attackTime = attackTime / speed
                }
                if let decayTime = continuousHapticEvent.decayTime {
                    continuousHapticEvent.decayTime = decayTime / speed
                }
                if let releaseTime = continuousHapticEvent.releaseTime {
                    continuousHapticEvent.releaseTime = releaseTime / speed
                }
                hapticEvent = continuousHapticEvent
            }
            return hapticEvent
        }
    }
}

public extension HapticPattern {
    /// Changes the duration of this haptic pattern by adjusting its speed.
    ///
    /// - Parameters:
    ///   - speed: The speed at which to play the haptic pattern.
    ///
    /// - Returns:
    ///   A haptic pattern with the adjusted speed.
    func speed(_ speed: Double) -> HapticPattern {
        modifier(SpeedHapticPatternModifier(speed))
    }
}
