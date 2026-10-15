import Testing
@testable import PizzaTeigRechner

/// Kalibrierung am Original-Rezept: 9 Pizzen à 275 g, 11 % Protein.
struct DoughCalculatorTests {
    private let original = DoughCalculator.calculate(pizzaCount: 9, ballWeight: 275, hydrationPercent: 60)

    @Test func totalIncludesTwoPercentBuffer() {
        #expect(original.targetDoughWeight == 2475)
        #expect(abs(original.totalDoughWeight - 2524.5) < 0.001)
    }

    @Test func reproducesOriginalRecipe() {
        #expect(abs(original.total.flour - 1552) < 1)
        #expect(abs(original.total.water - 931) < 1)
        #expect(abs(original.total.salt - 39) < 0.1)
        #expect(abs(original.total.yeast - 3.4) < 0.01)
        #expect(abs(original.biga.water - 349) < 0.5)
    }

    @Test func bigaHoldsHalfTheFlourAndAllYeast() {
        #expect(abs(original.biga.flour - original.mainDough.flour) < 0.001)
        #expect(original.biga.yeast == original.total.yeast)
        #expect(original.mainDough.yeast == 0)
        #expect(original.biga.salt == 0)
    }

    @Test func extraPizzasGoIntoMainDoughWithoutYeast() {
        let extra = DoughCalculator.calculate(pizzaCount: 9, ballWeight: 275, hydrationPercent: 60, extraPizzaCount: 3)
        #expect(extra.biga == original.biga)
        #expect(extra.mainDough.flour > original.mainDough.flour)
        #expect(extra.total.yeast == original.total.yeast)
    }

    @Test(arguments: [(8.0, 55.5), (11.0, 60.0), (13.0, 63.0), (16.0, 67.5)])
    func recommendedHydrationFollowsProtein(protein: Double, expected: Double) {
        #expect(DoughCalculator.recommendedHydrationPercent(proteinPercent: protein) == expected)
    }
}
