import SwiftUI
import CoreHaptics

private struct HapticsViewModifier<Trigger: Equatable>: ViewModifier {
    private let trigger: Trigger
    private let haptics: () -> Haptics

    @State private var hapticEngine: CHHapticEngine?

    init(
        trigger: Trigger,
        @HapticsBuilder haptics: @escaping () -> Haptics
    ) {
        self.trigger = trigger
        self.haptics = haptics
    }

    func body(content: Content) -> some View {
        content
            .task(createHapticEngine)
            .onChange(of: trigger) { _ in
                triggerHaptics()
            }
    }

    private func triggerHaptics() {
        guard let hapticEngine else {
            return
        }

        do {
            let pattern = try haptics().pattern
            let player = try hapticEngine.makePlayer(with: pattern)
            try player.start(atTime: .zero)
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
        @HapticsBuilder haptics: @escaping () -> Haptics
    ) -> some View {
        modifier(
            HapticsViewModifier(
                trigger: trigger,
                haptics: haptics
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
