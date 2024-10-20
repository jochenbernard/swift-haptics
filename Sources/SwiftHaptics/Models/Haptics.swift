import CoreHaptics

public struct Haptics {
    private let internalEvents: [InternalHapticEvent]

    public var events: [HapticEvent] {
        internalEvents
    }

    public init(events: [HapticEvent]) {
        self.internalEvents = events.compactMap {
            $0 as? InternalHapticEvent
        }
    }

    var pattern: CHHapticPattern {
        get throws {
            try CHHapticPattern(
                events: internalEvents.map(\.event),
                parameters: []
            )
        }
    }
}
