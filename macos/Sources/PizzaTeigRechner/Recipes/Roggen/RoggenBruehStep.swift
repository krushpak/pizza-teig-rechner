import SwiftUI

struct RoggenBruehStep: View {
    let result: RoggenResult
    @Binding var bruehWasserPercent: Double

    var body: some View {
        StepCard(key: "roggen.brueh", number: 2, title: "Brühstück",
                 timing: "Am Backtag, ca. 2–3 Std. vor dem Hauptteig",
                 accent: Palette.steel,
                 instructions: Self.instructions,
                 ingredients: [
                    Ingredient(name: "Roggenschrot, grob", amount: Fmt.g0(result.schrot)),
                    Ingredient(name: "Wasser, kochend", amount: Fmt.g0(result.bruehWasser)),
                 ],
                 totalLabel: "Summe Brühstück",
                 total: Fmt.g0(result.bruehTotal)) {
            DisclosureBox(key: "roggen.bruehWasser", emoji: "💧", title: "Brühstück-Wassermenge", accent: Palette.steel) {
                SliderField(label: "Wasseranteil", value: $bruehWasserPercent, range: 100...150, step: 1, accent: Palette.steel)
                Hint("Original-Rezept: 400–600 g Wasser auf 400 g Roggenschrot (= 100–150 %). Mehr Wasser ergibt ein weicheres Brot.")
            }
        }
    }

    private static let instructions = [
        "Roggenschrot (grob gemahlen, z. B. gröbste Stufe der Getreidemühle) mit kochendem Wasser in einer Schüssel übergießen.",
        "Mit einem Deckel abdecken und ca. 2–3 Std. quellen und abkühlen lassen.",
    ]
}
