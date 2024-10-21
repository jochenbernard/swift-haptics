struct HapticPatternList: BaseHapticPattern {
    private let patterns: [HapticPattern]

    init(patterns: [HapticPattern]) {
        self.patterns = patterns
    }

    var baseHapticEvents: [HapticEvent] {
        patterns.flatMap(\.hapticEvents)
    }
}
