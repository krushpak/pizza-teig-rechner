import SwiftUI

/// Farbtokens, portiert aus der Web-Version (Web/index.html), damit Mac- und
/// Web-App dieselbe "Rezeptkarten"-Optik teilen. Alle Textfarben erreichen
/// mindestens 4,5:1 auf `bg` und `surface`.
enum Palette {
    static let bg = Color.dynamic(light: 0xF6EEDD, dark: 0x1C1310)
    static let surface = Color.dynamic(light: 0xFFFCF5, dark: 0x2A1D16)
    static let ink = Color.dynamic(light: 0x2B1B14, dark: 0xF3E9D8, highContrastLight: 0x1A0F0A, highContrastDark: 0xFFF8EC)
    static let inkSoft = Color.dynamic(light: 0x6B5744, dark: 0xB8A78E, highContrastLight: 0x4A3A2C, highContrastDark: 0xD9CBB4)
    static let passata = Color.dynamic(light: 0xB73E1D, dark: 0xE2653A, highContrastLight: 0x8F2C10, highContrastDark: 0xF59570)
    static let basil = Color.dynamic(light: 0x4B6B3A, dark: 0x86B968, highContrastLight: 0x34502A, highContrastDark: 0xA8D58E)
    // Hell: 0x86601A statt 0xA2721F aus der Web-Version, damit kleiner Text 4,9:1 erreicht.
    static let olive = Color.dynamic(light: 0x86601A, dark: 0xD9A54A, highContrastLight: 0x664812, highContrastDark: 0xEDC27A)
    static let steel = Color.dynamic(light: 0x4F6373, dark: 0x93A9BB, highContrastLight: 0x364753, highContrastDark: 0xB9CCDB)

    static let surfaceBorder = Color.dynamic(light: 0xE8E1D6, dark: 0x3B2F28, highContrastLight: 0x9C8E80, highContrastDark: 0x8A7B6C)
    static let divider = Color.dynamic(light: 0xDAD1C4, dark: 0x4A3D35, highContrastLight: 0x8C7E70, highContrastDark: 0x9A8B7C)
}
