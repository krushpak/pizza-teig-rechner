import SwiftUI

/// Ausklappbare, nummerierte Schritt-für-Schritt-Anleitung.
struct InstructionsBox: View {
    let key: String
    let steps: [String]
    let accent: Color

    var body: some View {
        DisclosureBox(key: key, emoji: "📋", title: "Rezept / Anleitung", accent: accent) {
            VStack(alignment: .leading, spacing: 9) {
                // Feste Liste – Position als Identität ist hier unbedenklich.
                ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("\(index + 1).")
                            .font(AppFont.mono(12, weight: .semibold))
                            .foregroundStyle(accent)
                            .frame(width: 20, alignment: .leading)
                        Text(step)
                            .font(AppFont.body(13))
                            .lineSpacing(2)
                            .foregroundStyle(Palette.ink)
                            .fixedSize(horizontal: false, vertical: true)
                            .textSelection(.enabled)
                    }
                }
            }
        }
    }
}
