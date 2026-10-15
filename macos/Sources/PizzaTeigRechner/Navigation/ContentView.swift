import SwiftUI

struct ContentView: View {
    /// Pro Fenster gespeichert, damit mehrere Fenster unabhängig navigieren.
    @SceneStorage("activeRecipe") private var selection: Recipe?
    @AppStorage("textScale") private var textScale = 1.0
    @Environment(\.undoManager) private var undoManager
    @State private var resetter = RecipeResetter()

    private var current: Recipe { selection ?? .pizza }

    var body: some View {
        NavigationSplitView {
            RecipeSidebar(selection: $selection)
        } detail: {
            RecipeDetail(recipe: current)
                // Neu aufbauen, wenn sich die Schriftgröße (⌘+ / ⌘−) ändert.
                .id(textScale)
                .navigationTitle(current.title)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Standardwerte", systemImage: "arrow.counterclockwise", action: resetter.reset)
                            .help("Einstellungen dieses Rezepts auf die Standardwerte zurücksetzen (⇧⌘R, widerrufbar mit ⌘Z)")
                    }
                }
        }
        .focusedSceneValue(\.activeRecipe, $selection)
        .focusedSceneValue(\.recipeResetter, resetter)
        .onChange(of: current, initial: true) { resetter.recipe = current }
        .onChange(of: undoManager, initial: true) { resetter.undoManager = undoManager }
        .task { selectDefaultRecipeIfNeeded() }
    }

    private func selectDefaultRecipeIfNeeded() {
        if selection == nil { selection = .pizza }
    }
}
