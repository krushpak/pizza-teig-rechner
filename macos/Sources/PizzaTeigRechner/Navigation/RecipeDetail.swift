import SwiftUI

struct RecipeDetail: View {
    let recipe: Recipe

    var body: some View {
        switch recipe {
        case .pizza: PizzaView()
        case .bread: BreadView()
        case .roggen: RoggenView()
        }
    }
}
