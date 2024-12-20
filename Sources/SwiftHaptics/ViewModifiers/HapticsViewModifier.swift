import SwiftUI
import CoreHaptics

private struct HapticsViewModifier<Trigger: Equatable>: ViewModifier {
    private let trigger: Trigger
    private let hapticPattern: () -> HapticPattern

    @State private var hapticEngine = HapticEngine()

    init(
        trigger: Trigger,
        @HapticPatternBuilder hapticPattern: @escaping () -> HapticPattern
    ) {
        self.trigger = trigger
        self.hapticPattern = hapticPattern
    }

    init(
        trigger: Trigger,
        hapticPattern: HapticPattern
    ) {
        self.init(trigger: trigger) {
            hapticPattern
        }
    }

    func body(content: Content) -> some View {
        content.onChange(of: trigger) { _ in
            hapticEngine.play(hapticPattern: hapticPattern)
        }
    }
}

public extension View {
    /// Plays the specified haptic pattern when the provided trigger value
    /// changes.
    ///
    /// - Parameters:
    ///   - trigger: A value to monitor for changes to determine when to play.
    ///   - hapticPattern: A ``SwiftHaptics/HapticPatternBuilder`` that produces
    ///                    the haptic pattern to play.
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

    /// Plays the specified haptic pattern when the provided trigger value
    /// changes.
    ///
    /// - Parameters:
    ///   - trigger: A value to monitor for changes to determine when to play.
    ///   - hapticPattern: The haptic pattern to play.
    func haptics(
        trigger: some Equatable,
        hapticPattern: HapticPattern
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
