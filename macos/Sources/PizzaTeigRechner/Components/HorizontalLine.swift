import SwiftUI

/// Waagerechte Linie durch die Mitte des Rahmens.
struct HorizontalLine: Shape {
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.move(to: CGPoint(x: 0, y: rect.midY))
            p.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        }
    }
}
