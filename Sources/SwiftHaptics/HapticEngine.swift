import CoreHaptics

public class HapticEngine {
    private let hapticEngine: CHHapticEngine?
    private var hapticPatternEndDate: Date?

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

    public func play(hapticPattern: HapticPattern) {
        play {
            hapticPattern
        }
    }
}
