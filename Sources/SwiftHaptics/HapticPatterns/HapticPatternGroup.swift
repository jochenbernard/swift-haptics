public struct HapticPatternGroup: HapticPattern {
    let hapticPattern: () -> HapticPattern

    public init(@HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern) {
        self.hapticPattern = hapticPattern
    }

    public var pattern: HapticPattern {
        hapticPattern()
    }
}
