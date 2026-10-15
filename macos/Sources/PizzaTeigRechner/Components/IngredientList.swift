import SwiftUI

struct IngredientList: View {
    let items: [Ingredient]

    var body: some View {
        VStack(spacing: 0) {
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                VStack(spacing: 0) {
                    HStack(alignment: .firstTextBaseline) {
                        Text(item.name)
                            .font(AppFont.body(14))
                            .foregroundStyle(Palette.ink)
                        Spacer(minLength: 12)
                        Text(item.amount)
                            .font(item.isNote ? AppFont.body(13) : AppFont.mono(14, weight: .semibold))
                            .foregroundStyle(item.isNote ? Palette.inkSoft : Palette.ink)
                            .monospacedDigit()
                            .multilineTextAlignment(.trailing)
                            .textSelection(.enabled)
                    }
                    .padding(.vertical, 8)
                    DashedDivider()
                        .opacity(index < items.count - 1 ? 1 : 0)
                }
            }
        }
    }
}
