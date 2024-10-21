public protocol HapticPatternModifier {
    @HapticPatternBuilder
    func pattern(pattern: HapticPattern) -> HapticPattern
}
