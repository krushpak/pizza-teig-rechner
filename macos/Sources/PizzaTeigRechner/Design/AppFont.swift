import SwiftUI

/// Schriften der App. macOS kennt kein Dynamic Type; stattdessen skaliert
/// Darstellung › Größer/Kleiner (⌘+ / ⌘−) alle Größen über `textScale`.
enum AppFont {
    static var scale: Double {
        let s = UserDefaults.standard.double(forKey: "textScale")
        return s > 0 ? s : 1
    }

    static func display(_ size: Double, weight: Font.Weight = .semibold) -> Font {
        .system(size: size * scale, weight: weight, design: .serif)
    }

    static func body(_ size: Double, weight: Font.Weight = .regular) -> Font {
        .system(size: size * scale, weight: weight, design: .default)
    }

    static func mono(_ size: Double, weight: Font.Weight = .medium) -> Font {
        .system(size: size * scale, weight: weight, design: .monospaced)
    }
}
