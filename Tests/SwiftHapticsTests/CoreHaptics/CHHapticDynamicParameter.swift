import CoreHaptics

extension CHHapticDynamicParameter {
    var testable: Testable {
        Testable(
            parameterID: parameterID,
            value: value,
            relativeTime: relativeTime
        )
    }

    struct Testable: Equatable {
        let parameterID: CHHapticDynamicParameter.ID
        let value: Float
        let relativeTime: TimeInterval

        init(
            parameterID: CHHapticDynamicParameter.ID,
            value: Float,
            relativeTime: TimeInterval
        ) {
            self.parameterID = parameterID
            self.value = value
            self.relativeTime = relativeTime
        }

        init(_ dynamicParameter: [CHHapticPattern.Key: Any]) {
            self.init(
                parameterID: dynamicParameter[.parameterID] as! CHHapticDynamicParameter.ID,
                value: dynamicParameter[.parameterValue] as! Float,
                relativeTime: dynamicParameter[.time] as! TimeInterval
            )
        }
    }
}
