struct MutedHapticPatternModifier: BaseHapticPatternModifier {
    let muted: Bool

    init(_ muted: Bool) {
        self.muted = muted
    }

    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent] {
        if muted {
            hapticEvents.map {
                var hapticEvent = $0
                hapticEvent.intensity = .zero
                hapticEvent.sharpness = .zero
                return hapticEvent
            }
        } else {
            hapticEvents
        }
    }
}

public extension HapticPattern {
    /// Mutes this haptic pattern
    ///
    /// - Parameters:
    ///   - muted: Whether the haptic pattern is muted. The default value is
    ///            `true`.
    ///
    /// - Returns:
    ///   A haptic pattern that is muted.
    func muted(_ muted: Bool = true) -> HapticPattern {
        modifier(MutedHapticPatternModifier(muted))
    }
}
