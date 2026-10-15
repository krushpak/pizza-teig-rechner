import SwiftUI

/// Überblick über den Gesamtteig. Bewusst ruhig gehalten – das Markenzeichen
/// der App sind die farbigen Schrittkarten.
struct SummaryCard: View {
    let totalGrams: Double
    let stats: [SummaryStat]

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .firstTextBaseline) {
                Text("Gesamtteig")
                    .font(AppFont.body(13.5, weight: .medium))
                    .foregroundStyle(Palette.inkSoft)
                Spacer()
                Text(Fmt.g0(totalGrams))
                    .font(AppFont.mono(28, weight: .semibold))
                    .foregroundStyle(Palette.ink)
                    .contentTransition(.numericText())
            }
            .accessibilityElement(children: .combine)

            HStack(spacing: 10) {
                ForEach(stats) { stat in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(stat.label)
                            .font(AppFont.body(11.5))
                            .foregroundStyle(Palette.inkSoft)
                        Text(stat.value)
                            .font(AppFont.mono(14, weight: .semibold))
                            .foregroundStyle(Palette.ink)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .insetBox()
                    .accessibilityElement(children: .combine)
                }
            }
        }
        .padding(Metrics.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle()
        .animation(.snappy(duration: 0.2), value: totalGrams)
    }
}
