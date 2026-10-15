import SwiftUI

/// Rezeptseite. Ab `Metrics.twoColumnMinWidth` zweispaltig: links Überblick,
/// Einstellungen und Einkaufsliste (scrollt separat), rechts die Zubereitung.
/// Schmaler einspaltig in der Reihenfolge der Web-Version.
struct RecipePage<Summary: View, Steps: View, Shopping: View>: View {
    let eyebrow: String
    let intro: String
    let footnote: String
    @ContentBuilder let summary: Summary
    @ContentBuilder let steps: Steps
    @ContentBuilder let shopping: Shopping

    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack(alignment: .top, spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: Metrics.sectionSpacing) {
                        RecipeHeader(eyebrow: eyebrow, intro: intro)
                        summary
                        shopping
                    }
                    .padding(24)
                }
                .frame(width: Metrics.summaryColumnWidth)

                Rectangle().fill(Palette.divider).frame(width: 1)

                ScrollView {
                    VStack(alignment: .leading, spacing: Metrics.sectionSpacing) {
                        SectionTitle("Zubereitung")
                        steps
                        Footnote(footnote)
                    }
                    .frame(maxWidth: 680, alignment: .leading)
                    .padding(.horizontal, Metrics.pagePadding)
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(minWidth: Metrics.twoColumnMinWidth, idealWidth: Metrics.twoColumnMinWidth, maxWidth: .infinity)

            ScrollView {
                VStack(alignment: .leading, spacing: Metrics.sectionSpacing) {
                    RecipeHeader(eyebrow: eyebrow, intro: intro)
                    summary
                    SectionTitle("Zubereitung")
                    steps
                    shopping
                    Footnote(footnote)
                }
                .frame(maxWidth: 620, alignment: .leading)
                .padding(.horizontal, Metrics.pagePadding)
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
            }
        }
        .background(Palette.bg)
    }
}
