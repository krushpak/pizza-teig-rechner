import Testing
@testable import PizzaTeigRechner

/// Deutsche Formate wie in der Web-Version.
struct FmtTests {
    @Test func gramsWithGroupingAndDecimalComma() {
        #expect(Fmt.g1(1551.32) == "1.551,3 g")
        #expect(Fmt.g0(2524.5) == "2.525 g")
        #expect(Fmt.g0(133.4) == "133 g")
    }

    @Test func percentages() {
        #expect(Fmt.pct1(60) == "60,0 %")
        #expect(Fmt.pctShort(11) == "11 %")
        #expect(Fmt.pctShort(11.5) == "11,5 %")
    }
}
