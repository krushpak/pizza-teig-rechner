/// Roggenbrot (Engelmann'scher Flachlaib / EFL#1), 1:1 portiert aus der Web-Version.
///
/// Kalibriert am Original: 500g Roggenvollkornmehl + 500g Wasser (Sauerteig),
/// 400g Roggenschrot + 500g kochendes Wasser (Brühstück, Mittelwert aus 400-600),
/// 450g Pizza-Weizenmehl, 10g Brotgewürz, 30g Salz, 45g Backmalz (Mittelwert aus 40-50),
/// für 2 Laibe -> Referenzmehl 1350g, Referenzwasser 1000g.
enum RoggenCalculator {
    static let totalFlourRef = 500.0 + 400.0 + 450.0
    static let saltPercent = 30.0 / 1350.0
    static let spicePercent = 10.0 / 1350.0
    static let roggenvollkornShare = 500.0 / 1350.0
    static let roggenschrotShare = 400.0 / 1350.0
    static let weizenShare = 450.0 / 1350.0

    static func calculate(count: Int, weight: Double, bruehWasserPercent: Double, maltGrams: Double, hefeGrams: Double) -> RoggenResult {
        let target = Double(count) * weight
        let bruehRatio = bruehWasserPercent / 100
        let maltp = maltGrams / totalFlourRef
        let hefep = hefeGrams / totalFlourRef

        let denom = (2 * roggenvollkornShare + roggenschrotShare * (1 + bruehRatio) + weizenShare)
            + saltPercent + maltp + spicePercent + hefep
        let flourEq = target / denom

        let rv = flourEq * roggenvollkornShare
        let sauerWasser = rv // 1:1 Mehl/Wasser-Fütterung
        let rs = flourEq * roggenschrotShare
        let bruehWasser = rs * bruehRatio
        let w = flourEq * weizenShare

        return RoggenResult(
            target: target,
            hydration: (sauerWasser + bruehWasser) / (rv + rs + w) * 100,
            vollkorn: rv,
            sauerWasser: sauerWasser,
            schrot: rs,
            bruehWasser: bruehWasser,
            weizen: w,
            gewuerz: flourEq * spicePercent,
            salz: flourEq * saltPercent,
            malz: flourEq * maltp,
            hefe: flourEq * hefep
        )
    }
}
