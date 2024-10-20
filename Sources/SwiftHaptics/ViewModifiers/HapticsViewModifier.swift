import SwiftUI

private struct HapticsViewModifier<Trigger: Equatable>: ViewModifier {
    private let trigger: Trigger
    private let haptics: () -> Haptics

    init(
        trigger: Trigger,
        @HapticsBuilder haptics: @escaping () -> Haptics
    ) {
        self.trigger = trigger
        self.haptics = haptics
    }

    func body(content: Content) -> some View {
        content
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
