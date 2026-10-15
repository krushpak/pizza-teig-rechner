import SwiftUI

struct RoggenSauerteigStep: View {
    let result: RoggenResult

    var body: some View {
        StepCard(key: "roggen.sauerteig", number: 1, title: "Sauerteig",
                 timing: "Mind. 12 Std. vorher ansetzen, ideal 26–28 °C",
                 accent: Palette.olive,
                 instructions: Self.instructions,
                 ingredients: [
                    Ingredient(name: "Roggenvollkornmehl", amount: Fmt.g0(result.vollkorn)),
                    Ingredient(name: "Wasser, warm (≤50 °C)", amount: Fmt.g0(result.sauerWasser)),
                    Ingredient(name: "Sauerteigstarter", amount: "aktiver Starter aus dem Glas", isNote: true),
                 ],
                 totalLabel: "Summe Sauerteig (zzgl. Starter)",
                 total: Fmt.g0(result.sauerteigTotal))
    }

    private static let instructions = [
        "Roggenvollkornmehl, warmes Wasser (max. 50 °C) und Sauerteigstarter in einer Schüssel vermischen, bis keine Mehlnester mehr sichtbar sind.",
        "Mit einem Deckel mit kleinem Loch verschließen und mindestens 12 Std. an einem warmen Ort (ideal 26–28 °C) versauern lassen. Der Ansatz kann je nach Aktivität bis zum Deckel aufsteigen.",
        "Fertig ist der Sauerteig, wenn er schön porig geworden ist und säuerlich riecht – je länger er versauert, desto flüssiger und säuerlicher wird er.",
    ]
}
