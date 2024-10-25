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

        init(
            type: EventType,
            eventParameters: [CHHapticEventParameter.Testable],
            relativeTime: TimeInterval,
            duration: TimeInterval
        ) {
            self.type = type
            self.eventParameters = eventParameters
            self.relativeTime = relativeTime
            self.duration = duration
        }

        init(_ event: [CHHapticPattern.Key: Any]) {
            let parameters = event[.eventParameters] as! [[CHHapticPattern.Key: Any]]

            self.init(
                type: event[.eventType] as! CHHapticEvent.EventType,
                eventParameters: parameters.map(CHHapticEventParameter.Testable.init),
                relativeTime: event[.time] as! TimeInterval,
                duration: event[.eventDuration] as! TimeInterval
            )
        }
    }
}
