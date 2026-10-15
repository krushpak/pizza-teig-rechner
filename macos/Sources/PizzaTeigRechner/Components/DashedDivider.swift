import SwiftUI

struct DashedDivider: View {
    var body: some View {
        HorizontalLine()
            .stroke(Palette.divider, style: StrokeStyle(lineWidth: 1, dash: [3, 3]))
            .frame(height: 1)
            .accessibilityHidden(true)
    }
}
