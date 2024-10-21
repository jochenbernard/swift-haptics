import SwiftUI
import CoreHaptics

private struct HapticsViewModifier<Trigger: Equatable>: ViewModifier {
    private let trigger: Trigger
    private let hapticPattern: () -> HapticPattern

    @State private var hapticsEndDate: Date?
    @State private var hapticEngine: CHHapticEngine?

    init(
        trigger: Trigger,
        @HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern
    ) {
        self.trigger = trigger
        self.hapticPattern = hapticPattern
    }

    func body(content: Content) -> some View {
        content
            .task(createHapticEngine)
            .onChange(of: trigger) { _ in
                triggerHaptics()
            }
    }

    private func triggerHaptics() {
        guard
            let hapticEngine,
            (hapticsEndDate ?? .distantPast) <= .now
        else {
            return
        }

        do {
            let pattern = try hapticPattern().corePattern
            let player = try hapticEngine.makePlayer(with: pattern)
            try player.start(atTime: .zero)
            hapticsEndDate = .now.addingTimeInterval(pattern.duration)
        } catch {
            print(error)
        }
    }

    private func createHapticEngine() {
        guard
            self.hapticEngine == nil,
            CHHapticEngine.capabilitiesForHardware().supportsHaptics
        else {
            return
        }

        do {
            let hapticEngine = try CHHapticEngine()
            hapticEngine.resetHandler = resetHapticEngine
            self.hapticEngine = hapticEngine
            try hapticEngine.start()
        } catch {
            print(error)
        }
    }

    private func resetHapticEngine() {
        guard let hapticEngine else {
            return
        }

        do {
            try hapticEngine.start()
        } catch {
            print(error)
        }
    }
}

public extension View {
    func haptics(
        trigger: some Equatable,
        @HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern
    ) -> some View {
        modifier(
            HapticsViewModifier(
                trigger: trigger,
                hapticPattern: hapticPattern
            )
        )
    }
}

private struct HapticsViewModifierPreview: View {
    @State private var trigger = false

    var body: some View {
        Button("Trigger") {
            trigger.toggle()
        }
        .haptics(trigger: trigger) {
            TransientHapticEvent(time: 0.0)

            ContinuousHapticEvent(
                time: 0.5,
                duration: 0.5
            )
        }
    }
}

#Preview {
    HapticsViewModifierPreview()
}
