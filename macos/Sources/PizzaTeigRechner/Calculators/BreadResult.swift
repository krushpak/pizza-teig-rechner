/// Ergebnis der Weizenbrot-Berechnung (Sauerteig mit Roggen-Vorteig).
struct BreadResult: Equatable {
    var target: Double
    var hydration: Double
    var vorteigRoggen: Double
    var vorteigWater: Double
    var mainWater: Double
    var pizzaMehl: Double
    var semola: Double
    var weizen: Double
    var kartoffeln: Double
    var malt: Double
    var salt: Double
    var totalWater: Double

    var vorteigTotal: Double { vorteigRoggen + vorteigWater }
    var mainTotal: Double { mainWater + pizzaMehl + semola + weizen + kartoffeln + malt + salt }
}
