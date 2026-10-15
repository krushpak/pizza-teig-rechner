import SwiftUI

/// Einkaufsliste eines Rezepts; stellt sie auch dem Menübefehl „Einkaufsliste kopieren“ bereit.
struct ShoppingCard: View {
    let items: [Ingredient]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 9) {
                Image(systemName: "bag")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Palette.olive)
                    .accessibilityHidden(true)
                Text("Einkaufsliste")
                    .font(AppFont.display(17, weight: .medium))
                    .foregroundStyle(Palette.ink)
                    .accessibilityAddTraits(.isHeader)
                Spacer()
                CopyButton(items: items)
            }
            IngredientList(items: items)
        }
        .padding(.horizontal, Metrics.cardPadding)
        .padding(.top, 16)
        .padding(.bottom, 14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .cardStyle(border: Palette.olive, lineWidth: 1.5)
        .focusedSceneValue(\.shoppingList, items)
    }
}
