import CoreHaptics

public protocol HapticPattern {
    @HapticPatternBuilder
    var pattern: HapticPattern { get }
}

extension HapticPattern {
    public func modifier(_ modifier: HapticPatternModifier) -> HapticPattern {
        ModifiedHapticPattern(
            hapticPattern: self,
            modifier: modifier
        )
    }

    var hapticEvents: [HapticEvent] {
        if let basePattern = self as? BaseHapticPattern {
            basePattern.baseHapticEvents
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
