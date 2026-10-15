import SwiftUI

/// Setzt das im Fenster gezeigte Rezept zurück. Wird pro Fenster einmal angelegt und
/// dem Menü über `focusedSceneValue` bereitgestellt.
@MainActor
@Observable
final class RecipeResetter {
    var recipe = Recipe.pizza
    @ObservationIgnored weak var undoManager: UndoManager?

    func reset() {
        recipe.resetDefaults(undoManager: undoManager)
    }
}
