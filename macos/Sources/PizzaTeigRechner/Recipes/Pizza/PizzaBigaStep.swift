import SwiftUI

struct PizzaBigaStep: View {
    let biga: DoughResult.Portion

    var body: some View {
        StepCard(key: "pizza.biga", number: 1, title: "Biga (Vorteig)",
                 timing: "Am Vortag ansetzen und zugedeckt reifen lassen",
                 accent: Palette.olive,
                 instructions: Self.instructions,
                 ingredients: [
                    Ingredient(name: "Pizzamehl", amount: Fmt.g1(biga.flour)),
                    Ingredient(name: "Wasser, kalt", amount: Fmt.g1(biga.water)),
                    Ingredient(name: "Frischhefe", amount: Fmt.g1(biga.yeast)),
                 ],
                 totalLabel: "Summe Biga",
                 total: Fmt.g1(biga.flour + biga.water + biga.yeast))
    }

    private static let instructions = [
        "Frischhefe im kalten Wasser auflösen, bis keine Klümpchen mehr zu sehen sind.",
        "Mehl in eine luftdichte Box geben und die Hefe-Wasser-Mischung dazugießen.",
        "Deckel schließen und kräftig schütteln, bis grobe, unregelmäßige Teigstücke entstehen – nicht verkneten, die Biga bleibt bewusst klumpig.",
        "Mehlreste vom Deckel und Rand nach innen abstreifen, dann nochmal kurz schütteln, bis kein trockenes Mehl mehr übrig ist.",
        "Fest verschlossen 12–18 Std. bei Raumtemperatur reifen lassen.",
    ]
}
