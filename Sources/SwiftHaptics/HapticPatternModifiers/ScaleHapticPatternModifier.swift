struct ScaleHapticPatternModifier: BaseHapticPatternModifier {
    let intensityScale: Double
    let sharpnessScale: Double

    init(
        intensity intensityScale: Double,
        sharpness sharpnessScale: Double
    ) {
        self.intensityScale = intensityScale
        self.sharpnessScale = sharpnessScale
    }

    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent] {
        hapticEvents.map {
            var hapticEvent = $0
            if let intensity = hapticEvent.intensity {
                hapticEvent.intensity = intensity * intensityScale
            }
            if let sharpness = hapticEvent.sharpness {
                hapticEvent.sharpness = sharpness * sharpnessScale
            }
            return hapticEvent
        }
    }
}

public extension HapticPattern {
    /// Scales this haptic pattern's intensity and sharpness by the given
    /// amounts.
    ///
    /// - Parameters:
    ///   - intensity: The amount to scale the intensity. The default value is
    ///                `1.0`.
    ///   - sharpness: The amount to scale the sharpness. The default value is
    ///                `1.0`
    ///
    /// - Returns:
    ///   A haptic pattern with the scaled intensity and sharpness.
    func scale(
        intensity intensityScale: Double = 1.0,
        sharpness sharpnessScale: Double = 1.0
    ) -> HapticPattern {
        modifier(
            ScaleHapticPatternModifier(
                intensity: intensityScale,
                sharpness: sharpnessScale
            )
        )
    }
}
