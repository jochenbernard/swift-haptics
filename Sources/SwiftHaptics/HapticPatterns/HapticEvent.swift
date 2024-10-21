import CoreHaptics

protocol HapticEvent: BaseHapticPattern {
    var time: Double { get set }
    var intensity: Double? { get set }
    var sharpness: Double? { get set }
    var attackTime: Double? { get }
    var decayTime: Double? { get }
    var releaseTime: Double? { get }
    var sustained: Bool? { get }

    var coreEvent: CHHapticEvent { get }
}

extension HapticEvent {
    var baseHapticEvents: [HapticEvent] {
        [self]
    }

    var coreParameters: [CHHapticEventParameter] {
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
