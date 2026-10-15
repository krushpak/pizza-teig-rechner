import SwiftUI

struct BreadBakeStep: View {
    var body: some View {
        StepCard(key: "bread.bake", number: 3, title: "Backen",
                 timing: "Tag 3, morgens",
                 accent: Palette.olive,
                 instructions: Self.instructions)
    }

    private static let instructions = [
        "Ofen auf 230 °C Umluft vorheizen, eine große Schale Wasser mit in den Ofen stellen – sorgt für Luftfeuchtigkeit, eine schöne Kruste und verhindert trockene Flecken.",
        "Warten, bis Ofen und Wasser richtig heiß sind. Brote 30 Minuten in der Form auf mittlerer Schiene backen.",
        "Brote aus der Form nehmen, Wasserschale entfernen, weitere 20–30 Minuten ohne Form fertig backen.",
        "Für die letzten 30 Minuten die Temperatur etwas reduzieren, damit die Brote nicht zu dunkel werden.",
    ]
}
