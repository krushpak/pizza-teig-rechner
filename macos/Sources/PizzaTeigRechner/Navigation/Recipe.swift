import SwiftUI

enum Recipe: String, CaseIterable, Identifiable {
    case pizza, bread, roggen

    var id: String { rawValue }

    var title: String {
        switch self {
        case .pizza: "Pizza"
        case .bread: "Weizenbrot"
        case .roggen: "Roggenbrot"
        }
    }

    var subtitle: String {
        switch self {
        case .pizza: "Biga-Pizzateig"
        case .bread: "Helles Sauerteigbrot"
        case .roggen: "Flachlaib EFL#1"
        }
    }

    var emoji: String {
        switch self {
        case .pizza: "🍕"
        case .bread: "🍞"
        case .roggen: "🌾"
        }
    }

    var shortcut: KeyEquivalent {
        switch self {
        case .pizza: "1"
        case .bread: "2"
        case .roggen: "3"
        }
    }

    /// UserDefaults-Schlüssel der Einstellungen dieses Rezepts.
    var storageKeys: [String] {
        switch self {
        case .pizza: ["pizza.count", "pizza.ballWeight", "pizza.protein", "pizza.hydration", "pizza.hydrationManual", "pizza.extra"]
        case .bread: ["bread.count", "bread.weight", "bread.semola", "bread.kartoffel"]
        case .roggen: ["roggen.count", "roggen.weight", "roggen.bruehWasser", "roggen.malt", "roggen.hefe"]
        }
    }

    /// Setzt alle Einstellungen auf die Standardwerte – mit Widerrufen/Wiederholen.
    @MainActor
    func resetDefaults(undoManager: UndoManager?) {
        Self.apply(.empty(storageKeys), undoManager: undoManager, actionName: "Standardwerte \(title)")
    }

    @MainActor
    private static func apply(_ snapshot: DefaultsSnapshot, undoManager: UndoManager?, actionName: String) {
        let previous = DefaultsSnapshot.capture(snapshot.keys)
        snapshot.restore()
        guard let undoManager else { return }
        undoManager.registerUndo(withTarget: undoManager) { target in
            MainActor.assumeIsolated {
                apply(previous, undoManager: target, actionName: actionName)
            }
        }
        undoManager.setActionName(actionName)
    }
}
