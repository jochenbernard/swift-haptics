@resultBuilder
public struct HapticPatternBuilder {
    public static func buildArray(_ patterns: [HapticPattern]) -> HapticPattern {
        HapticPatternList(patterns: patterns)
    }

    public static func buildOptional(_ pattern: HapticPattern?) -> HapticPattern {
        if let pattern {
            pattern
        } else {
            EmptyHapticPattern()
        }
    }

    public static func buildEither(first pattern: HapticPattern) -> HapticPattern {
        pattern
    }

    public static func buildEither(second pattern: HapticPattern) -> HapticPattern {
        pattern
    }

    public static func buildBlock(_ patterns: HapticPattern...) -> HapticPattern {
        HapticPatternList(patterns: patterns)
    }
}
