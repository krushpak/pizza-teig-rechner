import SwiftUI

extension FocusedValues {
    /// Rezeptauswahl des aktiven Fensters (für ⌘1–3).
    @Entry var activeRecipe: Binding<Recipe?>?
    /// Einkaufsliste des aktiven Fensters (für ⇧⌘C).
    @Entry var shoppingList: [Ingredient]?
    /// Zurücksetzen des aktiven Fensters (für ⇧⌘R).
    @Entry var recipeResetter: RecipeResetter?
}
