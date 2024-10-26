/// A type that collects multiple haptic patterns into a single unit.
public struct HapticPatternGroup: HapticPattern {
    let hapticPattern: () -> HapticPattern

    /// Creates a group of haptic patterns.
    ///
    /// - Parameters:
    ///   - hapticPattern: A ``SwiftHaptics/HapticPatternBuilder`` that produces
    ///                    the haptic patterns to group.
    public init(@HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern) {
        self.hapticPattern = hapticPattern
    }

    public var pattern: HapticPattern {
        hapticPattern()
    }
}
