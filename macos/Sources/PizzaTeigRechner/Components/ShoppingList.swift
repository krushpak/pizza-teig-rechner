import SwiftUI

/// Kopiert eine Einkaufsliste als Text in die Zwischenablage.
enum ShoppingList {
    @MainActor
    static func copy(_ items: [Ingredient]) {
        let text = items.map { "\($0.name): \($0.amount)" }.joined(separator: "\n")
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
    }
}
