import CoreHaptics

extension CHHapticPattern {
    var testable: Testable {
        get throws {
            let dictionary = try exportDictionary()
            let pattern = dictionary[.pattern] as! [[CHHapticPattern.Key: Any]]

            var events = [CHHapticEvent.Testable]()
            var parameters = [CHHapticDynamicParameter.Testable]()

            pattern.forEach {
                if let event = $0[.event] {
                    let event = event as! [CHHapticPattern.Key: Any]
                    events.append(CHHapticEvent.Testable(event))
                } else if let parameter = $0[.parameter] {
                    let parameter = parameter as! [CHHapticPattern.Key: Any]
                    parameters.append(CHHapticDynamicParameter.Testable(parameter))
                }
            }

            return Testable(
                events: events,
                parameters: parameters
            )
        }
    }

    struct Testable: Equatable {
        let events: [CHHapticEvent.Testable]
        let parameters: [CHHapticDynamicParameter.Testable]
    }
}
