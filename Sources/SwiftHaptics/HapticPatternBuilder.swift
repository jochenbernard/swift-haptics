/// A custom parameter attribute that constructs haptic patterns from closures.
@resultBuilder
public struct HapticPatternBuilder {
    public static func buildArray(_ patterns: [HapticPattern]) -> HapticPattern {
        switch patterns.count {
        case 0:
            EmptyHapticPattern()
        case 1:
            patterns[0]
        default:
            HapticPatternList(patterns: patterns)
        }
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
        buildArray(patterns)
    }
}
