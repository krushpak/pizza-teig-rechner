import SwiftUI

struct PizzaSettings: View {
    @Binding var pizzaCount: Int
    @Binding var ballWeight: Int
    @Binding var proteinPercent: Double
    @Binding var hydrationPercent: Double
    let hydrationManual: Bool
    let onResetHydration: () -> Void

    private var hydrationHint: String {
        if hydrationManual {
            let recommended = DoughCalculator.recommendedHydration(proteinPercent: proteinPercent) * 100
            return "Formel-Empfehlung bei \(Fmt.pct1(proteinPercent)) Protein: \(Fmt.pct1(recommended))"
        }
        return "Automatisch aus Protein-Gehalt berechnet – zum manuellen Anpassen ziehen oder Wert eintippen."
    }

    var body: some View {
        SectionTitle("Einstellungen")
        Card {
            StepperField(label: "Anzahl Pizzen", value: $pizzaCount, range: 1...50)
            StepperField(label: "Gewicht pro Teigling", value: $ballWeight, range: 100...500, step: 5, unit: "g")
            SliderField(label: "Protein-Gehalt Mehl", value: $proteinPercent, range: 8...16, step: 0.5,
                        fractionDigits: 1)
            SliderField(label: "Hydration (Wassergehalt)", value: $hydrationPercent, range: 45...85, step: 0.5,
                        fractionDigits: 1, hint: hydrationHint,
                        onReset: hydrationManual ? onResetHydration : nil)
        }
    }
}
