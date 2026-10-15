import SwiftUI

@main
struct PizzaTeigRechnerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 640, minHeight: 560)
        }
        .defaultSize(width: 1200, height: 860)
        .commands {
            RecipeCommands()
            TextSizeCommands()
        }
    }
}
