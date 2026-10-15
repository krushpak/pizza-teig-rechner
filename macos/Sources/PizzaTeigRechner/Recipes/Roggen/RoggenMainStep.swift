import SwiftUI

struct RoggenMainStep: View {
    let result: RoggenResult
    @Binding var maltGrams: Double
    @Binding var hefeGrams: Double

    private var ingredients: [Ingredient] {
        [
            Ingredient(name: "Pizza-Weizenmehl Tipo 00", amount: Fmt.g0(result.weizen)),
            Ingredient(name: "Brotgewürz", amount: Fmt.g0(result.gewuerz)),
            Ingredient(name: "Salz", amount: Fmt.g0(result.salz)),
            Ingredient(name: "Backmalz", amount: Fmt.g0(result.malz)),
            result.hefe > 0.05 ? Ingredient(name: "Hefe", amount: Fmt.g0(result.hefe)) : nil,
        ].compactMap { $0 }
    }

    var body: some View {
        StepCard(key: "roggen.main", number: 3, title: "Hauptteig",
                 timing: "Am Backtag, mit Sauerteig und Brühstück verkneten",
                 accent: Palette.basil,
                 instructions: Self.instructions,
                 ingredients: ingredients,
                 totalLabel: "Summe Hauptteig-Zutaten",
                 total: Fmt.g0(result.mainTotal)) {
            DisclosureBox(key: "roggen.maltHefe", emoji: "🌾", title: "Backmalz & Hefe", accent: Palette.steel) {
                SliderField(label: "Backmalz", value: $maltGrams, range: 40...50, step: 1, unit: "g", accent: Palette.steel)
                SliderField(label: "Zusätzliche Hefe (optional)", value: $hefeGrams, range: 0...20, step: 1, unit: "g", accent: Palette.steel)
                Hint("Mengen bezogen auf 2 Laibe à ca. 1218 g, skalieren mit deiner Laibanzahl mit. Hefe ist laut Rezept optional (\"ggf.\") – beschleunigt die Gare, meist nicht nötig.")
            }
        }
    }

    private static let instructions = [
        "Das abgekühlte Brühstück mit dem fertigen Sauerteig vermischen.",
        "Pizza-Weizenmehl, Brotgewürz, Salz und Backmalz (und ggf. Hefe) dazugeben.",
        "5–10 Minuten mit der Küchenmaschine (Knethaken) verkneten.",
        "Teig in gleich große Portionen teilen und in bemehlte Gärkörbchen geben (ca. halbvoll).",
        "Mit einem Küchenhandtuch abgedeckt an einem warmen Ort (ideal 26 °C) gehen lassen, bis der Teig am oberen Rand der Gärkörbchen angekommen ist (oder leicht darüber).",
    ]
}
