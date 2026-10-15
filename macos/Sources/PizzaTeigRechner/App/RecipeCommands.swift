import SwiftUI

/// Menü „Rezept“: Rezept wechseln, Einkaufsliste kopieren, Standardwerte.
struct RecipeCommands: Commands {
    @FocusedValue(\.activeRecipe) private var activeRecipe
    @FocusedValue(\.shoppingList) private var shoppingList
    @FocusedValue(\.recipeResetter) private var resetter

    var body: some Commands {
        CommandMenu("Rezept") {
            ForEach(Recipe.allCases) { recipe in
                Button(recipe.title) { select(recipe) }
                    .keyboardShortcut(recipe.shortcut, modifiers: .command)
                    .disabled(activeRecipe == nil)
            }
            Divider()
            Button("Einkaufsliste kopieren", action: copyShoppingList)
                .keyboardShortcut("c", modifiers: [.command, .shift])
                .disabled(shoppingList == nil)
            Button("Auf Standardwerte zurücksetzen", action: reset)
                .keyboardShortcut("r", modifiers: [.command, .shift])
                .disabled(resetter == nil)
        }
    }

    private func select(_ recipe: Recipe) {
        activeRecipe?.wrappedValue = recipe
    }

    private func copyShoppingList() {
        if let shoppingList { ShoppingList.copy(shoppingList) }
    }

    private func reset() {
        resetter?.reset()
    }
}
