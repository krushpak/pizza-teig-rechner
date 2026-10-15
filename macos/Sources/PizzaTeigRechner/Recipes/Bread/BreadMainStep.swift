import SwiftUI

struct BreadMainStep: View {
    let result: BreadResult
    @Binding var semolaPercent: Double
    @Binding var kartoffelPercent: Double

    private var ingredients: [Ingredient] {
        [
            Ingredient(name: "Wasser, eiskalt", amount: Fmt.g0(result.mainWater)),
            Ingredient(name: "Pizzamehl Typ 00", amount: Fmt.g0(result.pizzaMehl)),
            result.semola > 0.05 ? Ingredient(name: "Semola", amount: Fmt.g0(result.semola)) : nil,
            Ingredient(name: "Weizenmehl Typ 550", amount: Fmt.g0(result.weizen)),
            result.kartoffeln > 0.05 ? Ingredient(name: "Kartoffeln, gequetscht", amount: Fmt.g0(result.kartoffeln)) : nil,
            Ingredient(name: "Backmalz", amount: Fmt.g0(result.malt)),
            Ingredient(name: "Salz", amount: Fmt.g0(result.salt)),
        ].compactMap { $0 }
    }

    var body: some View {
        StepCard(key: "bread.main", number: 2, title: "Hauptteig",
                 timing: "Tag 2, morgens mit dem gereiften Vorteig verkneten",
                 accent: Palette.basil,
                 instructions: Self.instructions,
                 ingredients: ingredients,
                 totalLabel: "Summe Hauptteig",
                 total: Fmt.g0(result.mainTotal)) {
            DisclosureBox(key: "bread.variants", emoji: "🥔", title: "Mehl-Varianten", accent: Palette.steel) {
                SliderField(label: "Semola-Anteil (ersetzt Pizzamehl)",
                            value: $semolaPercent, range: 0...50, step: 1, accent: Palette.steel)
                SliderField(label: "Kartoffel-Anteil (ersetzt Weizenmehl)",
                            value: $kartoffelPercent, range: 0...40, step: 1, accent: Palette.steel)
                Hint("Pizzamehl lässt sich zu bis zu 50 % mit Semola (feiner Hartweizengrieß) ersetzen – ergibt eine besonders gute Kruste. Weizenmehl lässt sich teilweise durch gequetschte, gekochte Kartoffeln ersetzen.")
            }
        }
    }

    private static let instructions = [
        "Wasser, den fertigen Vorteig sowie Pizzamehl/Semola und Weizenmehl/Kartoffeln in eine große Schüssel geben.",
        "Vorteig dabei nicht mit den Fingern berühren – Löffel oder Spatel verwenden, um Schimmelbildung zu vermeiden. Ca. 50–70 g Vorteig für den nächsten Ansatz zurückbehalten und kühl lagern.",
        "Backmalz und Salz dazugeben, alles gut vermengen.",
        "Mit einem Tuch abdecken, 3–4 Std. bei Raumtemperatur gehen lassen, dann in geölte Backformen füllen.",
        "Alternativ: Teig direkt in geölte Formen füllen und unabgedeckt über Nacht im Kühlschrank reifen lassen.",
    ]
}
