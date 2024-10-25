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
    }
}
