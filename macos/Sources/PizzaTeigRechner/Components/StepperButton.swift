import SwiftUI

/// −/+ einer `StepperField`. ⇧-Klick meldet den zehnfachen Schritt.
struct StepperButton: View {
    let title: String
    let systemImage: String
    let isEnabled: Bool
    let accent: Color
    let onStep: (_ multiplier: Int) -> Void

    var body: some View {
        Button(action: step) {
            Label(title, systemImage: systemImage)
                .labelStyle(.iconOnly)
                .font(.system(size: 13, weight: .bold))
                .frame(width: 32, height: 30)
                .contentShape(.rect)
        }
        .buttonStyle(.plain)
        .buttonRepeatBehavior(.enabled)
        .foregroundStyle(accent)
        .opacity(isEnabled ? 1 : 0.3)
        .disabled(!isEnabled)
        .help("⇧-Klick: zehnfacher Schritt")
    }

    private func step() {
        onStep(NSEvent.modifierFlags.contains(.shift) ? 10 : 1)
    }
}
