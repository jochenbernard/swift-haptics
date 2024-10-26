import CoreHaptics

/// An object that represents the connection to the haptic server.
public class HapticEngine {
    private let hapticEngine: CHHapticEngine?
    private var hapticPatternEndDate: Date?

    /// Creates a haptic engine.
    public init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            hapticEngine = nil
            return
        }

        do {
            hapticEngine = try CHHapticEngine()
        } catch {
            print(error)
            hapticEngine = nil
        }

        guard let hapticEngine else {
            return
        }

        do {
            hapticEngine.resetHandler = reset
            try hapticEngine.start()
        } catch {
            print(error)
        }
    }

    private func reset() {
        guard let hapticEngine else {
            return
        }

        do {
            try hapticEngine.start()
        } catch {
            print(error)
        }
    }

    /// Plays a haptic pattern.
    ///
    /// - Parameters:
    ///   - hapticPattern: A ``SwiftHaptics/HapticPatternBuilder`` that produces
    ///                    the haptic pattern to play.
    public func play(@HapticPatternBuilder hapticPattern: () -> HapticPattern) {
        guard
            let hapticEngine,
            (hapticPatternEndDate ?? .distantPast) <= .now
        else {
            return
        }

        do {
            let corePattern = try hapticPattern().corePattern
            let player = try hapticEngine.makePlayer(with: corePattern)
            try player.start(atTime: .zero)
            hapticPatternEndDate = .now + corePattern.duration
        } catch {
            print(error)
        }
    }

    /// Plays a haptic pattern.
    ///
    /// - Parameters:
    ///   - hapticPattern: The haptic pattern to play.
    public func play(hapticPattern: HapticPattern) {
        play {
            hapticPattern
        }
    }
}
