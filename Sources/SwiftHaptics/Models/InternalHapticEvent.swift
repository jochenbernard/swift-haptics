import CoreHaptics

protocol InternalHapticEvent: HapticEvent {
    var event: CHHapticEvent { get }
    var attackTime: Double? { get }
    var decayTime: Double? { get }
    var releaseTime: Double? { get }
    var sustained: Bool? { get }
}

extension InternalHapticEvent {
    var parameters: [CHHapticEventParameter] {
        let parameters: [(id: CHHapticEvent.ParameterID, value: Double?)] = [
            (id: .hapticIntensity, value: intensity),
            (id: .hapticSharpness, value: sharpness),
            (id: .attackTime, value: attackTime),
            (id: .decayTime, value: decayTime),
            (id: .releaseTime, value: releaseTime),
            (id: .sustained, value: sustained.map({ $0 ? 1.0 : 0.0 }))
        ]

        return parameters.compactMap { id, value in
            guard let value else {
                return nil
            }

            return CHHapticEventParameter(
                parameterID: id,
                value: Float(value)
            )
        }
    }
}
