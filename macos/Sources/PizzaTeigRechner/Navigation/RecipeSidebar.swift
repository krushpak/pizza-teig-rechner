import SwiftUI

struct RecipeSidebar: View {
    @Binding var selection: Recipe?

    var body: some View {
        List(selection: $selection) {
            Section("Rezepte") {
                ForEach(Recipe.allCases) { recipe in
                    Label {
                        VStack(alignment: .leading, spacing: 1) {
                            Text(recipe.title)
                            Text(recipe.subtitle)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    } icon: {
                        Text(recipe.emoji).accessibilityHidden(true)
                    }
                    .padding(.vertical, 3)
                    .tag(recipe)
                }
            }
        }
        .navigationSplitViewColumnWidth(min: 190, ideal: 215, max: 280)
    }
}
