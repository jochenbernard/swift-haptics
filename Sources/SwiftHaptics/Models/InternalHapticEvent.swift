import CoreHaptics

protocol InternalHapticEvent: HapticEvent {
    var event: CHHapticEvent { get }
}
