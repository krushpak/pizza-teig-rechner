import SwiftUI

extension Color {
    /// Farbe, die zwischen Hell- und Dunkelmodus umschaltet und bei „Kontrast erhöhen“
    /// (Bedienungshilfen) auf eigene, kräftigere Werte wechselt.
    static func dynamic(light: UInt32, dark: UInt32, highContrastLight: UInt32? = nil, highContrastDark: UInt32? = nil) -> Color {
        Color(nsColor: NSColor(name: nil) { appearance in
            let match = appearance.bestMatch(from: [
                .aqua, .darkAqua, .accessibilityHighContrastAqua, .accessibilityHighContrastDarkAqua,
            ])
            return switch match {
            case .accessibilityHighContrastDarkAqua: NSColor(hex: highContrastDark ?? dark)
            case .accessibilityHighContrastAqua: NSColor(hex: highContrastLight ?? light)
            case .darkAqua: NSColor(hex: dark)
            default: NSColor(hex: light)
            }
        })
    }
}
