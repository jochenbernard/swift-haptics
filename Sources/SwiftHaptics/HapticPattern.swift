import CoreHaptics

/// A type that represents a haptic pattern and provides modifiers that you use
/// to configure haptics.
public protocol HapticPattern {
    /// The pattern of the haptics.
    @HapticPatternBuilder
    var pattern: HapticPattern { get }
}

extension HapticPattern {
    /// Applies a modifier to this haptic pattern and returns a new haptic
    /// pattern.
    ///
    /// - Parameters:
    ///   - modifier: The modifier to apply to the haptic pattern.
    ///
    /// - Returns:
    ///   The haptic pattern with the applied modifier.
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
