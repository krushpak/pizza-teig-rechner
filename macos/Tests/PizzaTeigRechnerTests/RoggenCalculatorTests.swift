import Testing
@testable import PizzaTeigRechner

/// Kalibrierung am Original-Rezept für 2 Laibe (Gesamtteig 2435 g).
struct RoggenCalculatorTests {
    @Test func reproducesOriginalRecipe() {
        let r = RoggenCalculator.calculate(count: 1, weight: 2435, bruehWasserPercent: 125, maltGrams: 45, hefeGrams: 0)
        #expect(abs(r.vollkorn - 500) < 0.01)
        #expect(abs(r.sauerWasser - 500) < 0.01)
        #expect(abs(r.schrot - 400) < 0.01)
        #expect(abs(r.bruehWasser - 500) < 0.01)
        #expect(abs(r.weizen - 450) < 0.01)
        #expect(abs(r.salz - 30) < 0.01)
        #expect(abs(r.malz - 45) < 0.01)
        #expect(abs(r.gewuerz - 10) < 0.01)
        #expect(r.hefe == 0)
        #expect(abs(r.hydration - 74.074) < 0.001)
    }

    @Test func partsAddUpToTarget() {
        let r = RoggenCalculator.calculate(count: 2, weight: 1218, bruehWasserPercent: 140, maltGrams: 48, hefeGrams: 10)
        #expect(abs(r.sauerteigTotal + r.bruehTotal + r.mainTotal - 2436) < 0.001)
    }
}
