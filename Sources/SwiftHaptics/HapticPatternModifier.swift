/// A modifier that you apply to a haptic pattern or another haptic pattern
/// modifier, producing a different version of the original value.
public protocol HapticPatternModifier {
    /// Gets the current pattern of the caller.
    @HapticPatternBuilder
    func pattern(pattern: HapticPattern) -> HapticPattern
}
