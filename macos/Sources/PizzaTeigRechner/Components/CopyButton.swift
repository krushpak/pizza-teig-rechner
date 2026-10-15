import SwiftUI

/// Kopiert die Einkaufsliste und zeigt kurz „Kopiert“ als Bestätigung.
struct CopyButton: View {
    let items: [Ingredient]
    @State private var copied = false

    var body: some View {
        Button(action: copy) {
            Label(copied ? "Kopiert" : "Kopieren", systemImage: copied ? "checkmark" : "doc.on.doc")
                .font(AppFont.body(12, weight: .medium))
                .padding(.horizontal, 9)
                .frame(minHeight: 24)
                .contentShape(.capsule)
        }
        .buttonStyle(.plain)
        .foregroundStyle(Palette.olive)
        .overlay { Capsule().strokeBorder(Palette.olive.opacity(0.5)) }
        .help("Einkaufsliste in die Zwischenablage kopieren (⇧⌘C)")
        .task(id: copied) {
            guard copied else { return }
            try? await Task.sleep(for: .seconds(1.5))
            withAnimation { copied = false }
        }
    }

    private func copy() {
        ShoppingList.copy(items)
        withAnimation { copied = true }
    }
}
