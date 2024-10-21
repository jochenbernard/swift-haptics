protocol BaseHapticPatternModifier: HapticPatternModifier {
    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent]
}

extension BaseHapticPatternModifier {
    public func pattern(pattern: HapticPattern) -> HapticPattern {
        EmptyHapticPattern()
    }
}
