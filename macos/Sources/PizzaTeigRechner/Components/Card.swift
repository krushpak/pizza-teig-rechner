import SwiftUI

struct Card<Content: View>: View {
    @ContentBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: Metrics.sectionSpacing) { content }
            .padding(Metrics.cardPadding)
            .frame(maxWidth: .infinity, alignment: .leading)
            .cardStyle()
    }
}
