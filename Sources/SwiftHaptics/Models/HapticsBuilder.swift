@resultBuilder
public struct HapticsBuilder {
    public static func buildBlock(_ events: HapticEvent...) -> Haptics {
        Haptics(events: events)
    }
}
