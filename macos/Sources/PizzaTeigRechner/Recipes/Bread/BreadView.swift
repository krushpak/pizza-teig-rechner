import SwiftUI

struct BreadView: View {
    @AppStorage("bread.count") private var breadCount = 1
    @AppStorage("bread.weight") private var breadWeight = 1447
    @AppStorage("bread.semola") private var semolaPercent = 50.0
    @AppStorage("bread.kartoffel") private var kartoffelPercent = BreadCalculator.defaultKartoffelPercent

    private var result: BreadResult {
        BreadCalculator.calculate(breadCount: breadCount, breadWeight: Double(breadWeight),
                                  semolaPercent: semolaPercent, kartoffelPercent: kartoffelPercent)
    }

    var body: some View {
        let result = self.result
        RecipePage(eyebrow: "Roggen-Vorteig · Tag 1–3",
                   intro: "Skaliert Mehl, Wasser, Salz und Backmalz auf deine Brotanzahl und das gewünschte Gewicht pro Brot um.",
                   footnote: "Enthält weder deinen Sauerteigstarter aus dem Glas noch die ca. 50–70 g, die du für den nächsten Ansatz zurückbehältst – beides ist keine zugekaufte Zutat.") {
            SectionTitle("Einstellungen")
            Card {
                StepperField(label: "Anzahl Brote", value: $breadCount, range: 1...10)
                StepperField(label: "Gewicht pro Brot", value: $breadWeight, range: 500...2500, step: 25, unit: "g")
            }
            SummaryCard(totalGrams: result.target, stats: [
                SummaryStat(label: "Hydration", value: Fmt.pct1(result.hydration)),
                SummaryStat(label: "Brote", value: "\(breadCount) × \(breadWeight) g"),
            ])
        } steps: {
            BreadVorteigStep(result: result)
            BreadMainStep(result: result, semolaPercent: $semolaPercent, kartoffelPercent: $kartoffelPercent)
            BreadBakeStep()
        } shopping: {
            ShoppingCard(items: Self.shoppingItems(for: result))
        }
    }

    private static func shoppingItems(for r: BreadResult) -> [Ingredient] {
        [
            Ingredient(name: "Roggenvollkornmehl", amount: Fmt.g0(r.vorteigRoggen)),
            Ingredient(name: "Pizzamehl Typ 00", amount: Fmt.g0(r.pizzaMehl)),
            r.semola > 0.05 ? Ingredient(name: "Semola", amount: Fmt.g0(r.semola)) : nil,
            Ingredient(name: "Weizenmehl Typ 550", amount: Fmt.g0(r.weizen)),
            r.kartoffeln > 0.05 ? Ingredient(name: "Kartoffeln, gequetscht", amount: Fmt.g0(r.kartoffeln)) : nil,
            Ingredient(name: "Wasser", amount: Fmt.g0(r.totalWater)),
            Ingredient(name: "Backmalz", amount: Fmt.g0(r.malt)),
            Ingredient(name: "Salz", amount: Fmt.g0(r.salt)),
        ].compactMap { $0 }
    }
}
