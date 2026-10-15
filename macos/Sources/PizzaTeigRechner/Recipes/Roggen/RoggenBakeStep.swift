import SwiftUI

struct RoggenBakeStep: View {
    var body: some View {
        StepCard(key: "roggen.bake", number: 4, title: "Backen",
                 timing: "Dampf-Backofen, gestufte Feuchtigkeit",
                 accent: Palette.passata,
                 instructions: Self.instructions)
    }

    private static let instructions = [
        "Ofen auf 230 °C mit 100 % Feuchtigkeit vorheizen.",
        "Teig vorsichtig aus den Gärkörbchen auf ein mit Dauerbackfolie belegtes Rost stürzen und in den Ofen schieben.",
        "20 Minuten bei 230 °C und 100 % Feuchtigkeit backen.",
        "20 Minuten bei 230 °C und 60 % Feuchtigkeit backen.",
        "20 Minuten bei 230 °C und 30 % Feuchtigkeit backen – je nach gewünschter Krustenfestigkeit ggf. anpassen.",
    ]
}
