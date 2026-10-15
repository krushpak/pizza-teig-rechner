import SwiftUI

struct PizzaMainStep: View {
    let mainDough: DoughResult.Portion
    @Binding var extraPizzaCount: Int

    var body: some View {
        StepCard(key: "pizza.main", number: 2, title: "Hauptteig",
                 timing: "Am Backtag mit der gereiften Biga verkneten",
                 badge: extraPizzaCount > 0 ? "inkl. \(extraPizzaCount) zusätzliche Teiglinge" : nil,
                 accent: Palette.basil,
                 instructions: Self.instructions,
                 ingredients: [
                    Ingredient(name: "Pizzamehl", amount: Fmt.g1(mainDough.flour)),
                    Ingredient(name: "Wasser, eiskalt", amount: Fmt.g1(mainDough.water)),
                    Ingredient(name: "Salz", amount: Fmt.g1(mainDough.salt)),
                 ],
                 totalLabel: "Summe Hauptteig",
                 total: Fmt.g1(mainDough.flour + mainDough.water + mainDough.salt)) {
            DisclosureBox(key: "pizza.extra", emoji: "➕", title: "Zusätzliche Pizzen ohne Vorteig", accent: Palette.steel) {
                StepperField(label: "Zusätzliche Pizzen", value: $extraPizzaCount, range: 0...10, accent: Palette.steel)
                Hint("Für Pizzen, die du kurzfristig ergänzt, wenn die Biga schon reift. Mehl und Wasser werden oben direkt mit eingerechnet – ohne zusätzliche Hefe.")
                if extraPizzaCount >= DoughCalculator.extraDoughYeastHintThreshold {
                    Hint("Bei \(extraPizzaCount) zusätzlichen Teiglingen reift der Teig ohne Vorteig spürbar langsamer – eventuell etwas frische Hefe mit einkneten.",
                         color: Palette.passata, weight: .semibold)
                }
            }
        }
    }

    private static let instructions = [
        "Ca. 2 Std. vor dem Kneten die abgewogene Wassermenge in den Gefrierschrank stellen, bis sie eiskalt ist (nicht komplett gefrieren lassen).",
        "Biga, Mehl und das eiskalte Wasser in die Knetschüssel geben und auf niedriger Stufe vermischen, bis kein trockenes Mehl mehr sichtbar ist.",
        "Insgesamt 10–12 Minuten kneten. Nach den ersten 5 Minuten das Salz einrieseln lassen, dann auf gleicher Stufe weiterkneten.",
        "Teigtemperatur im Blick behalten – sie sollte 23 °C nicht übersteigen. Wird der Teig zu warm, die Maschine eine Stufe niedriger stellen.",
        "Fertig gekneteten Teig aus der Schüssel nehmen und luftdicht abgedeckt 15 Minuten ruhen lassen.",
        "Teig in Portionen teilen und zu glatten Bällen schleifen.",
        "Bälle abgedeckt 3 Std. bei Raumtemperatur gehen lassen, bis sie sichtbar aufgegangen sind.",
    ]
}
