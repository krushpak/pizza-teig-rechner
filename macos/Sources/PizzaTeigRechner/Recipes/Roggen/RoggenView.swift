import SwiftUI

struct RoggenView: View {
    @AppStorage("roggen.count") private var count = 2
    @AppStorage("roggen.weight") private var weight = 1218
    @AppStorage("roggen.bruehWasser") private var bruehWasserPercent = 125.0
    @AppStorage("roggen.malt") private var maltGrams = 45.0
    @AppStorage("roggen.hefe") private var hefeGrams = 0.0

    private var result: RoggenResult {
        RoggenCalculator.calculate(count: count, weight: Double(weight), bruehWasserPercent: bruehWasserPercent,
                                   maltGrams: maltGrams, hefeGrams: hefeGrams)
    }

    var body: some View {
        let result = self.result
        RecipePage(eyebrow: "Engelmann'scher Flachlaib · EFL#1",
                   intro: "Sauerteig + Brühstück aus Roggenschrot, mit Pizzamehl zum Flachlaib verknetet. Skaliert auf deine Laibanzahl und das gewünschte Gewicht pro Laib.",
                   footnote: "Enthält nicht deinen Sauerteigstarter aus dem Glas. Mehl-Tipp: Roggenmehl & -schrot von Demeter, Pizzamehl von Caputo (blauer Sack) oder eine deutsche Tipo-00-Alternative.") {
            SectionTitle("Einstellungen")
            Card {
                StepperField(label: "Anzahl Laibe", value: $count, range: 1...10)
                StepperField(label: "Gewicht pro Laib", value: $weight, range: 500...2500, step: 25, unit: "g")
            }
            SummaryCard(totalGrams: result.target, stats: [
                SummaryStat(label: "Hydration", value: Fmt.pct1(result.hydration)),
                SummaryStat(label: "Laibe", value: "\(count) × \(weight) g"),
            ])
        } steps: {
            RoggenSauerteigStep(result: result)
            RoggenBruehStep(result: result, bruehWasserPercent: $bruehWasserPercent)
            RoggenMainStep(result: result, maltGrams: $maltGrams, hefeGrams: $hefeGrams)
            RoggenBakeStep()
        } shopping: {
            ShoppingCard(items: Self.shoppingItems(for: result))
        }
    }

    private static func shoppingItems(for r: RoggenResult) -> [Ingredient] {
        [
            Ingredient(name: "Roggenvollkornmehl", amount: Fmt.g0(r.vollkorn)),
            Ingredient(name: "Roggenschrot, grob", amount: Fmt.g0(r.schrot)),
            Ingredient(name: "Pizza-Weizenmehl Tipo 00", amount: Fmt.g0(r.weizen)),
            Ingredient(name: "Wasser", amount: Fmt.g0(r.totalWasser)),
            Ingredient(name: "Brotgewürz", amount: Fmt.g0(r.gewuerz)),
            Ingredient(name: "Salz", amount: Fmt.g0(r.salz)),
            Ingredient(name: "Backmalz", amount: Fmt.g0(r.malz)),
            r.hefe > 0.05 ? Ingredient(name: "Hefe", amount: Fmt.g0(r.hefe)) : nil,
        ].compactMap { $0 }
    }
}
