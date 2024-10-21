protocol BaseHapticPattern: HapticPattern {
    var baseHapticEvents: [HapticEvent] { get }
}

extension BaseHapticPattern {
    public var pattern: HapticPattern {
        EmptyHapticPattern()
    }
}
