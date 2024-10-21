struct ModifiedHapticPattern: BaseHapticPattern {
    private let hapticPattern: HapticPattern
    private let modifier: HapticPatternModifier

    init(
        hapticPattern: HapticPattern,
        modifier: HapticPatternModifier
    ) {
        self.hapticPattern = hapticPattern
        self.modifier = modifier
    }

    var baseHapticEvents: [HapticEvent] {
        if let baseModifier = modifier as? BaseHapticPatternModifier {
            baseModifier.modify(hapticEvents: hapticPattern.hapticEvents)
        } else {
            modifier.pattern(pattern: hapticPattern).hapticEvents
        }
    }
}
