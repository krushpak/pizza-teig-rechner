/// Ergebnis der Roggenbrot-Berechnung (Engelmann'scher Flachlaib / EFL#1).
struct RoggenResult: Equatable {
    var target: Double
    var hydration: Double
    var vollkorn: Double
    var sauerWasser: Double
    var schrot: Double
    var bruehWasser: Double
    var weizen: Double
    var gewuerz: Double
    var salz: Double
    var malz: Double
    var hefe: Double

    var sauerteigTotal: Double { vollkorn + sauerWasser }
    var bruehTotal: Double { schrot + bruehWasser }
    var mainTotal: Double { weizen + gewuerz + salz + malz + hefe }
    var totalWasser: Double { sauerWasser + bruehWasser }
}
