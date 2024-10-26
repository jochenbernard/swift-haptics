/// A haptic pattern that doesn't contain any events.
public struct EmptyHapticPattern: BaseHapticPattern {
    /// Creates an empty haptic pattern.
    public init() {}

    var baseHapticEvents: [HapticEvent] {
        []
    }
}
