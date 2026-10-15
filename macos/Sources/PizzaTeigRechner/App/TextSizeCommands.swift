import SwiftUI

/// Darstellung › Größer / Kleiner / Originalgröße (⌘+ / ⌘− / ⌘0).
struct TextSizeCommands: Commands {
    @AppStorage("textScale") private var textScale = 1.0

    private static let range = 0.9...1.5

    var body: some Commands {
        CommandGroup(after: .toolbar) {
            Divider()
            Button("Größer", action: increase)
                .keyboardShortcut("+", modifiers: .command)
                .disabled(textScale >= Self.range.upperBound)
            Button("Kleiner", action: decrease)
                .keyboardShortcut("-", modifiers: .command)
                .disabled(textScale <= Self.range.lowerBound)
            Button("Originalgröße", action: resetSize)
                .keyboardShortcut("0", modifiers: .command)
                .disabled(textScale == 1)
        }
    }

    private func increase() { setScale(textScale + 0.1) }
    private func decrease() { setScale(textScale - 0.1) }
    private func resetSize() { setScale(1) }

    private func setScale(_ value: Double) {
        textScale = min(max((value * 10).rounded() / 10, Self.range.lowerBound), Self.range.upperBound)
    }
}
