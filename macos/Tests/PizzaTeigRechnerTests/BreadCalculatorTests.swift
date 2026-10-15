import Testing
@testable import PizzaTeigRechner

/// Kalibrierung am realen 3-Brote-Rezept (Gesamtteig 4340 g).
struct BreadCalculatorTests {
    @Test func reproducesThreeLoafRecipe() {
        let r = BreadCalculator.calculate(breadCount: 3, breadWeight: 4340.0 / 3, semolaPercent: 50,
                                          kartoffelPercent: BreadCalculator.defaultKartoffelPercent)
        #expect(abs(r.vorteigRoggen - 400) < 0.01)
        #expect(abs(r.vorteigWater - 400) < 0.01)
        #expect(abs(r.mainWater - 1250) < 0.01)
        #expect(abs(r.pizzaMehl - 400) < 0.01)
        #expect(abs(r.semola - 400) < 0.01)
        #expect(abs(r.weizen - 900) < 0.01)
        #expect(abs(r.kartoffeln - 450) < 0.01)
        #expect(abs(r.malt - 90) < 0.01)
        #expect(abs(r.salt - 50) < 0.01)
    }

    @Test func variantsShiftFlourButKeepTotal() {
        let none = BreadCalculator.calculate(breadCount: 1, breadWeight: 1447, semolaPercent: 0, kartoffelPercent: 0)
        #expect(none.semola == 0)
        #expect(none.kartoffeln == 0)
        #expect(abs(none.vorteigTotal + none.mainTotal - 1447) < 0.001)
    }
}
