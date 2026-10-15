import SwiftUI

/// Ausklappbarer Bereich; der Zustand wird pro `key` gespeichert und bleibt beim
/// Rezeptwechsel und nach dem Neustart erhalten.
struct DisclosureBox<Content: View>: View {
    let emoji: String
    let title: String
    let accent: Color
    let content: Content
    @AppStorage private var isOpen: Bool

    init(key: String, emoji: String, title: String, accent: Color, @ContentBuilder content: () -> Content) {
        self.emoji = emoji
        self.title = title
        self.accent = accent
        self.content = content()
        _isOpen = AppStorage(wrappedValue: false, "open.\(key)")
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: toggle) {
                HStack(spacing: 7) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 9, weight: .bold))
                        .rotationEffect(.degrees(isOpen ? 90 : 0))
                    Text(emoji).font(.system(size: 11))
                    Text(title.uppercased())
                        .font(AppFont.body(10.5, weight: .semibold))
                        .tracking(0.9)
                    Spacer(minLength: 0)
                }
                .foregroundStyle(accent)
                .frame(minHeight: 20)
                .contentShape(.rect)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(title)
            .accessibilityValue(isOpen ? "Ausgeklappt" : "Eingeklappt")

            if isOpen {
                VStack(alignment: .leading, spacing: 14) { content }
                    .padding(.top, 12)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 9)
        .insetBox()
        .clipped()
    }

    private func toggle() {
        withAnimation(.snappy(duration: 0.22)) { isOpen.toggle() }
    }
}
