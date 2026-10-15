import SwiftUI

/// Überzeile und Einleitung einer Rezeptseite.
struct RecipeHeader: View {
    let eyebrow: String
    let intro: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(eyebrow.uppercased())
                .font(AppFont.body(11, weight: .semibold))
                .tracking(1.5)
                .foregroundStyle(Palette.passata)
            Text(intro)
                .font(AppFont.body(13.5))
                .foregroundStyle(Palette.inkSoft)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
