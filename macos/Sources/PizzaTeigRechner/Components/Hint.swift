import SwiftUI

struct Hint: View {
    let text: String
    var color: Color = Palette.inkSoft
    var weight: Font.Weight = .regular

    init(_ text: String, color: Color = Palette.inkSoft, weight: Font.Weight = .regular) {
        self.text = text
        self.color = color
        self.weight = weight
    }

    var body: some View {
        Text(text)
            .font(AppFont.body(11.5, weight: weight))
            .foregroundStyle(color)
            .fixedSize(horizontal: false, vertical: true)
    }
}
