import SwiftUI

/// Farbige, nummerierte Karte für einen Zubereitungsschritt.
struct StepCard<Extra: View>: View {
    let key: String
    let number: Int
    let title: String
    let timing: String
    var badge: String?
    let accent: Color
    let instructions: [String]
    var ingredients: [Ingredient]
    var totalLabel: String?
    var total: String?
    let extra: Extra

    init(key: String, number: Int, title: String, timing: String, badge: String? = nil, accent: Color,
         instructions: [String], ingredients: [Ingredient] = [], totalLabel: String? = nil, total: String? = nil,
         @ContentBuilder extra: () -> Extra) {
        self.key = key
        self.number = number
        self.title = title
        self.timing = timing
        self.badge = badge
        self.accent = accent
        self.instructions = instructions
        self.ingredients = ingredients
        self.totalLabel = totalLabel
        self.total = total
        self.extra = extra()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .firstTextBaseline, spacing: 10) {
                Text("\(number)")
                    .font(AppFont.mono(12, weight: .semibold))
                    .foregroundStyle(accent)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 1)
                    .overlay { Capsule().strokeBorder(accent, lineWidth: 1.5) }
                    .accessibilityLabel("Schritt \(number)")
                Text(title)
                    .font(AppFont.display(17, weight: .medium))
                    .foregroundStyle(Palette.ink)
            }
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.isHeader)

            Text(timing)
                .font(AppFont.body(12.5))
                .foregroundStyle(Palette.inkSoft)
                .padding(.top, 6)
            if let badge {
                Text(badge)
                    .font(AppFont.body(12.5, weight: .semibold))
                    .foregroundStyle(Palette.steel)
                    .padding(.top, 3)
            }

            VStack(alignment: .leading, spacing: 10) {
                InstructionsBox(key: "\(key).steps", steps: instructions, accent: accent)
                extra
            }
            .padding(.top, 14)

            if !ingredients.isEmpty {
                IngredientList(items: ingredients)
                    .padding(.top, 8)
            }

            if let totalLabel, let total {
                Rectangle().fill(Palette.divider).frame(height: 1.5)
                    .padding(.top, 6)
                HStack {
                    Text(totalLabel)
                    Spacer()
                    Text(total).font(AppFont.mono(14, weight: .semibold)).monospacedDigit()
                }
                .font(AppFont.body(14, weight: .semibold))
                .foregroundStyle(Palette.ink)
                .padding(.top, 10)
                .accessibilityElement(children: .combine)
            }
        }
        .padding(.horizontal, Metrics.cardPadding)
        .padding(.top, 18)
        .padding(.bottom, Metrics.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle()
    }
}

extension StepCard where Extra == EmptyView {
    init(key: String, number: Int, title: String, timing: String, badge: String? = nil, accent: Color,
         instructions: [String], ingredients: [Ingredient] = [], totalLabel: String? = nil, total: String? = nil) {
        self.init(key: key, number: number, title: title, timing: timing, badge: badge, accent: accent,
                  instructions: instructions, ingredients: ingredients, totalLabel: totalLabel, total: total) { EmptyView() }
    }
}
