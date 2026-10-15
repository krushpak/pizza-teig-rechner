import SwiftUI

struct BreadVorteigStep: View {
    let result: BreadResult

    var body: some View {
        StepCard(key: "bread.vorteig", number: 1, title: "Vorteig",
                 timing: "Tag 1, ca. 12 Std. vor dem Hauptteig ansetzen (z. B. abends)",
                 accent: Palette.olive,
                 instructions: Self.instructions,
                 ingredients: [
                    Ingredient(name: "Roggenvollkornmehl", amount: Fmt.g0(result.vorteigRoggen)),
                    Ingredient(name: "Wasser", amount: Fmt.g0(result.vorteigWater)),
                    Ingredient(name: "Sauerteigstarter", amount: "gesamter Inhalt aus dem Glas", isNote: true),
                 ],
                 totalLabel: "Summe Vorteig (zzgl. Starter)",
                 total: Fmt.g0(result.vorteigTotal))
    }

    private static let instructions = [
        "Roggenvollkornmehl und Wasser in einer Schüssel gut vermischen.",
        "Deinen gesamten Sauerteigstarter aus dem Glas dazugeben – am einfachsten etwas vom abgewogenen Wasser ins Glas geben, kurz schütteln und dazugießen, so bekommst du ihn restlos heraus, ohne ihn zu berühren.",
        "Mit einem sauberen Tuch abdecken und an einem warmen Ort ca. 12 Std. reifen lassen.",
    ]
}
