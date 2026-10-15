import Foundation

/// Deutsche Zahlenformate wie in der Web-Version ("1.552,0 g", "60,0 %").
/// Gerundet wird kaufmännisch (wie `toLocaleString` im Browser).
enum Fmt {
    static let locale = Locale(identifier: "de_DE")

    static func number0(_ v: Double) -> String {
        v.formatted(.number.precision(.fractionLength(0)).rounded(rule: .toNearestOrAwayFromZero).locale(locale))
    }

    static func number1(_ v: Double) -> String {
        v.formatted(.number.precision(.fractionLength(1)).rounded(rule: .toNearestOrAwayFromZero).locale(locale))
    }

    /// "776,0 g"
    static func g1(_ v: Double) -> String { "\(number1(v)) g" }
    /// "1.447 g"
    static func g0(_ v: Double) -> String { "\(number0(v)) g" }
    /// "60,0 %"
    static func pct1(_ v: Double) -> String { "\(number1(v)) %" }
    /// "11 %" bzw. "11,5 %"
    static func pctShort(_ v: Double) -> String {
        "\(v.formatted(.number.precision(.fractionLength(0...1)).locale(locale))) %"
    }

    /// Eingabeformat für ganze Zahlen ohne Tausenderpunkt.
    static let integerInput = IntegerFormatStyle<Int>.number.grouping(.never).locale(locale)

    /// Eingabeformat für Dezimalzahlen ohne Tausenderpunkt.
    static func decimalInput(_ digits: Int) -> FloatingPointFormatStyle<Double> {
        .number.precision(.fractionLength(digits)).grouping(.never).locale(locale)
    }
}
