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
    func muted(_ muted: Bool = true) -> HapticPattern {
        modifier(MutedHapticPatternModifier(muted))
    }
}
