private struct ScaleHapticPatternModifier: BaseHapticPatternModifier {
    private let intensityScale: Double
    private let sharpnessScale: Double

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
