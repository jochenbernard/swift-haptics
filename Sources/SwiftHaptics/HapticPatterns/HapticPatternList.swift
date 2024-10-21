struct HapticPatternList: BaseHapticPattern {
    let patterns: [HapticPattern]

    var baseHapticEvents: [HapticEvent] {
        patterns.flatMap(\.hapticEvents)
    }
}
