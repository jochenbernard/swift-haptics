import CoreHaptics

extension CHHapticEvent {
    var testable: Testable {
        Testable(
            type: type,
            eventParameters: eventParameters.map(\.testable),
            relativeTime: relativeTime,
            duration: duration
        )
    }

    struct Testable: Equatable {
        let type: EventType
        let eventParameters: [CHHapticEventParameter.Testable]
        let relativeTime: TimeInterval
        let duration: TimeInterval
    }
}
