import SwiftUI

struct Footnote: View {
    let text: String
    init(_ text: String) { self.text = text }

    var body: some View {
        Text(text)
            .font(AppFont.body(11.5))
            .foregroundStyle(Palette.inkSoft)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
    }
}
