/// Ergebnis einer Pizzateig-Berechnung, aufgeteilt in Biga, Hauptteig und Gesamt.
struct DoughResult: Equatable {
    struct Portion: Equatable {
        var flour: Double
        var water: Double
        var yeast: Double
        var salt: Double

        var total: Double { flour + water + yeast + salt }
    }

    var biga: Portion
    var mainDough: Portion
    var total: Portion
    var targetDoughWeight: Double
    var totalDoughWeight: Double
}
