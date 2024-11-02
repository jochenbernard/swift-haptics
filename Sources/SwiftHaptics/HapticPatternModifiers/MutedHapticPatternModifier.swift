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
    /// Conditionally mutes this haptic pattern
    ///
    /// - Parameters:
    ///   - muted: Whether the haptic pattern is muted. The default value is
    ///            `true`.
    ///
    /// - Returns:
    ///   The haptic pattern that is conditionally muted.
    func muted(_ muted: Bool = true) -> HapticPattern {
        modifier(MutedHapticPatternModifier(muted))
    }
}
