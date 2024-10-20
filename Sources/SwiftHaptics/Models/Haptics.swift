import CoreHaptics

public struct Haptics {
    private let events: [InternalHapticEvent]

    public init(events: [HapticEvent]) {
        self.events = events.compactMap {
            $0 as? InternalHapticEvent
        }
    }

    var pattern: CHHapticPattern {
        get throws {
            try CHHapticPattern(
                events: events.map(\.event),
                parameters: []
            )
        }
    }
}
