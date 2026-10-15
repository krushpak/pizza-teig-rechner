import SwiftUI

struct PizzaView: View {
    @AppStorage("pizza.count") private var pizzaCount = 9
    @AppStorage("pizza.ballWeight") private var ballWeight = 275
    @AppStorage("pizza.protein") private var proteinPercent = 11.0
    @AppStorage("pizza.hydration") private var hydrationPercent = 60.0
    @AppStorage("pizza.hydrationManual") private var hydrationManual = false
    @AppStorage("pizza.extra") private var extraPizzaCount = 0

    private var result: DoughResult {
        DoughCalculator.calculate(pizzaCount: pizzaCount, ballWeight: Double(ballWeight),
                                  hydrationPercent: hydrationPercent, extraPizzaCount: extraPizzaCount)
    }

    /// Ändert der Protein-Gehalt sich, folgt die Hydration der Empfehlung – solange sie nicht manuell gesetzt wurde.
    private var proteinBinding: Binding<Double> {
        Binding(get: { proteinPercent }, set: { newValue in
            proteinPercent = newValue
            if !hydrationManual {
                hydrationPercent = DoughCalculator.recommendedHydrationPercent(proteinPercent: newValue)
            }
        })
    }

    /// Nur Eingaben des Nutzers markieren die Hydration als manuell (nicht `resetHydration()`).
    private var hydrationBinding: Binding<Double> {
        Binding(get: { hydrationPercent }, set: { newValue in
            hydrationPercent = newValue
            hydrationManual = true
        })
    }

    var body: some View {
        let result = self.result
        RecipePage(eyebrow: "Biga · 50 % Vorteig · reduzierter Trieb",
                   intro: "Skaliert Mehl, Wasser, Hefe und Salz auf deine Pizzenanzahl, Teiglingsgröße und Mehlsorte um.",
                   footnote: "Enthält 2 % Verarbeitungspuffer. Wasseraufnahme wird aus dem Protein-Gehalt geschätzt (Faustregel) und lässt sich manuell übersteuern.") {
            SummaryCard(totalGrams: result.totalDoughWeight, stats: [
                SummaryStat(label: "Hydration", value: Fmt.pct1(hydrationPercent)),
                SummaryStat(label: "Teiglinge", value: "\(pizzaCount) × \(ballWeight) g"),
            ])
            PizzaSettings(pizzaCount: $pizzaCount, ballWeight: $ballWeight,
                          proteinPercent: proteinBinding, hydrationPercent: hydrationBinding,
                          hydrationManual: hydrationManual, onResetHydration: resetHydration)
        } steps: {
            PizzaBigaStep(biga: result.biga)
            PizzaMainStep(mainDough: result.mainDough, extraPizzaCount: $extraPizzaCount)
        } shopping: {
            ShoppingCard(items: [
                Ingredient(name: "Pizzamehl (\(Fmt.pctShort(proteinPercent)) Protein)", amount: Fmt.g1(result.total.flour)),
                Ingredient(name: "Wasser", amount: Fmt.g1(result.total.water)),
                Ingredient(name: "Frischhefe", amount: Fmt.g1(result.total.yeast)),
                Ingredient(name: "Salz", amount: Fmt.g1(result.total.salt)),
            ])
        }
    }

    private func resetHydration() {
        hydrationPercent = DoughCalculator.recommendedHydrationPercent(proteinPercent: proteinPercent)
        hydrationManual = false
    }
}
