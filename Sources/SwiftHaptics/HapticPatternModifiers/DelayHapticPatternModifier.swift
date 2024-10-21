import Foundation

private struct DelayHapticPatternModifier: BaseHapticPatternModifier {
    private let delay: TimeInterval

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
    func delay(_ delay: TimeInterval) -> HapticPattern {
        modifier(DelayHapticPatternModifier(delay))
    }
}
