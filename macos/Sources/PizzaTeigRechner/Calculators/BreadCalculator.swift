/// Helles Sauerteigbrot, 1:1 portiert aus der Web-Version (Web/index.html).
///
/// Kalibriert am realen 3-Brote-Rezept: 400g Roggenvollkorn, 400g Wasser (Vorteig),
/// 1250g Wasser, 400g Pizzamehl, 400g Semola, 900g Weizen550, 450g Kartoffeln,
/// 90g Backmalz, 50g Salz im Hauptteig -> Gesamtmehl(-äquivalent) 2550g, Wasser 1650g.
enum BreadCalculator {
    static let hydration = 1650.0 / 2550.0
    static let saltPercent = 50.0 / 2550.0
    static let maltPercent = 90.0 / 2550.0
    static let roggenShare = 400.0 / 2550.0
    static let pizzaSemolaShare = 800.0 / 2550.0
    static let weizenKartoffelShare = 1350.0 / 2550.0

    static let defaultKartoffelPercent = 450.0 / 1350.0 * 100

    static func calculate(breadCount: Int, breadWeight: Double, semolaPercent: Double, kartoffelPercent: Double) -> BreadResult {
        let target = Double(breadCount) * breadWeight
        let flourEq = target / (1 + hydration + saltPercent + maltPercent)
        let water = flourEq * hydration
        let salt = flourEq * saltPercent
        let malt = flourEq * maltPercent

        let roggen = flourEq * roggenShare
        let vorteigWater = roggen // 1:1 Mehl/Wasser-Fütterung, wie im Original (400g/400g)

        let pizzaSemolaBucket = flourEq * pizzaSemolaShare
        let semolaFrac = semolaPercent / 100
        let semola = pizzaSemolaBucket * semolaFrac
        let pizzaMehl = pizzaSemolaBucket * (1 - semolaFrac)

        let weizenKartoffelBucket = flourEq * weizenKartoffelShare
        let kartoffelFrac = kartoffelPercent / 100
        let kartoffeln = weizenKartoffelBucket * kartoffelFrac
        let weizen = weizenKartoffelBucket * (1 - kartoffelFrac)

        return BreadResult(
            target: target,
            hydration: hydration * 100,
            vorteigRoggen: roggen,
            vorteigWater: vorteigWater,
            mainWater: water - vorteigWater,
            pizzaMehl: pizzaMehl,
            semola: semola,
            weizen: weizen,
            kartoffeln: kartoffeln,
            malt: malt,
            salt: salt,
            totalWater: water
        )
    }
}
