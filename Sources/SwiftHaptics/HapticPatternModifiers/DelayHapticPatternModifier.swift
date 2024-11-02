import Foundation

struct DelayHapticPatternModifier: BaseHapticPatternModifier {
    let delay: TimeInterval

    init(_ delay: TimeInterval) {
        self.delay = delay
    }

    func modify(hapticEvents: [HapticEvent]) -> [HapticEvent] {
        hapticEvents.map {
            var hapticEvent = $0
            hapticEvent.time += delay
            return hapticEvent
        }
    }
}

public extension HapticPattern {
    /// Delays the start of this haptic pattern by the specified number of
    /// seconds.
    ///
    /// - Parameters:
    ///   - delay: The number of seconds to delay the start of the haptic
    ///            pattern.
    ///
    /// - Returns:
    ///   The haptic pattern with a delayed start.
    func delay(_ delay: TimeInterval) -> HapticPattern {
        modifier(DelayHapticPatternModifier(delay))
    }
}
