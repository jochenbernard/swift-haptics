import CoreHaptics

public protocol HapticPattern {
    @HapticPatternBuilder
    var pattern: HapticPattern { get }
}

extension HapticPattern {
    var hapticEvents: [HapticEvent] {
        if let base = self as? BaseHapticPattern {
            base.baseHapticEvents
        } else {
            pattern.hapticEvents
        }
    }

    var corePattern: CHHapticPattern {
        get throws {
            try CHHapticPattern(
                events: hapticEvents.map(\.coreEvent),
                parameters: []
            )
        }
    }
}
