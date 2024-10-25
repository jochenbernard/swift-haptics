import CoreHaptics

extension CHHapticEventParameter {
    var testable: Testable {
        Testable(
            parameterID: parameterID,
            value: value
        )
    }

    struct Testable: Equatable {
        let parameterID: CHHapticEvent.ParameterID
        let value: Float

        init(
            parameterID: CHHapticEvent.ParameterID,
            value: Float
        ) {
            self.parameterID = parameterID
            self.value = value
        }

        init(_ eventParameter: [CHHapticPattern.Key: Any]) {
            self.init(
                parameterID: eventParameter[.parameterID] as! CHHapticEvent.ParameterID,
                value: eventParameter[.parameterValue] as! Float
            )
        }
    }
}
