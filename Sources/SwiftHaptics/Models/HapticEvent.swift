public protocol HapticEvent {
    var time: Double { get }
    var intensity: Double? { get }
    var sharpness: Double? { get }
}
