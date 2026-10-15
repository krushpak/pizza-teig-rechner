/// Pizzateig mit Biga, 1:1 portiert aus der Web-Version (Web/index.html).
///
/// Kalibriert am Original-Rezept:
/// 9 Pizzen à 275 g, 11% Protein-Mehl -> 1552 g Mehl, 931 g Wasser, 39 g Salz, 3,4 g Hefe,
/// Biga: 776 g Mehl / 349 g Wasser (45% Hydration), Hauptteig: 776 g Mehl / 582 g Wasser.
enum DoughCalculator {
    static let baseHydration = 0.60          // bei 11% Protein
    static let baseProtein = 11.0
    static let hydrationSensitivity = 0.015  // +1.5% Wasser je +1% Protein
    static let saltPercent = 39.0 / 1552.0
    static let yeastPercent = 3.4 / 1552.0
    static let bigaFlourShare = 0.50
    static let bigaHydration = 349.0 / 776.0 // ~45%, feste stabile Biga
    static let bufferMultiplier = 1.02       // entspricht 2475 g -> 2525 g im Originalrezept

    /// Ab dieser Anzahl zusätzlicher Teiglinge (ohne Vorteig) den Hefe-Hinweis zeigen.
    static let extraDoughYeastHintThreshold = 3

    /// Vom Protein-Gehalt abgeleitete Hydration-Empfehlung (0.0...1.0).
    static func recommendedHydration(proteinPercent: Double) -> Double {
        baseHydration + (proteinPercent - baseProtein) * hydrationSensitivity
    }

    /// Empfehlung in Prozent, auf eine Nachkommastelle gerundet (wie in der Web-Version).
    static func recommendedHydrationPercent(proteinPercent: Double) -> Double {
        (recommendedHydration(proteinPercent: proteinPercent) * 1000).rounded() / 10
    }

    static func calculate(pizzaCount: Int, ballWeight: Double, hydrationPercent: Double, extraPizzaCount: Int = 0) -> DoughResult {
        let hydration = hydrationPercent / 100

        let targetDough = Double(pizzaCount) * ballWeight
        let totalDough = targetDough * bufferMultiplier

        let baseFlour = totalDough / (1 + hydration + saltPercent + yeastPercent)
        let baseWater = baseFlour * hydration
        let baseSalt = baseFlour * saltPercent
        let baseYeast = baseFlour * yeastPercent

        let bigaFlour = baseFlour * bigaFlourShare
        let bigaWater = bigaFlour * bigaHydration
        let bigaYeast = baseYeast

        var mainFlour = baseFlour - bigaFlour
        var mainWater = baseWater - bigaWater
        var mainSalt = baseSalt

        if extraPizzaCount > 0 {
            let extraTarget = Double(extraPizzaCount) * ballWeight
            let extraTotal = extraTarget * bufferMultiplier
            let extraFlour = extraTotal / (1 + hydration + saltPercent)
            mainFlour += extraFlour
            mainWater += extraFlour * hydration
            mainSalt += extraFlour * saltPercent
        }

        let biga = DoughResult.Portion(flour: bigaFlour, water: bigaWater, yeast: bigaYeast, salt: 0)
        let main = DoughResult.Portion(flour: mainFlour, water: mainWater, yeast: 0, salt: mainSalt)
        let total = DoughResult.Portion(
            flour: biga.flour + main.flour,
            water: biga.water + main.water,
            yeast: biga.yeast + main.yeast,
            salt: biga.salt + main.salt
        )

        return DoughResult(biga: biga, mainDough: main, total: total,
                           targetDoughWeight: targetDough, totalDoughWeight: totalDough)
    }
}
