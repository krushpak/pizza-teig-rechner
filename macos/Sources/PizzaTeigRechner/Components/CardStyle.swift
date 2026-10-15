import SwiftUI

/// Hintergrund, Rand und Schatten einer Rezeptkarte.
struct CardStyle: ViewModifier {
    var border: Color = Palette.surfaceBorder
    var lineWidth = 1.0

    func body(content: Content) -> some View {
        content
            .background(Palette.surface, in: .rect(cornerRadius: Metrics.cardRadius))
            .overlay {
                RoundedRectangle(cornerRadius: Metrics.cardRadius)
                    .strokeBorder(border, lineWidth: lineWidth)
            }
            .shadow(color: .black.opacity(0.06), radius: 10, y: 5)
    }
}

extension View {
    func cardStyle(border: Color = Palette.surfaceBorder, lineWidth: Double = 1) -> some View {
        modifier(CardStyle(border: border, lineWidth: lineWidth))
    }

    /// Eingelassene Fläche (Ausklappbereiche, Kennzahlen, Eingabefelder).
    func insetBox(cornerRadius: Double = Metrics.boxRadius) -> some View {
        background(Palette.bg, in: .rect(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(Palette.surfaceBorder)
            }
    }
}
