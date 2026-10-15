import SwiftUI

/// Werteingabe: Feld zum Eintippen plus −/+. Eingaben werden auf `range` begrenzt.
struct StepperField: View {
    let label: String
    @Binding var value: Int
    let range: ClosedRange<Int>
    var step = 1
    var unit = ""
    var accent: Color = Palette.passata

    private var clampedValue: Binding<Int> {
        Binding(get: { value }, set: { value = min(max($0, range.lowerBound), range.upperBound) })
    }

    var body: some View {
        HStack(spacing: 12) {
            Text(label)
                .font(AppFont.body(13.5, weight: .medium))
                .foregroundStyle(Palette.ink)
            Spacer(minLength: 8)
            HStack(spacing: 2) {
                StepperButton(title: "\(label) verringern", systemImage: "minus",
                              isEnabled: value > range.lowerBound, accent: accent) { change(by: -$0) }
                HStack(spacing: 4) {
                    TextField(label, value: clampedValue, format: Fmt.integerInput)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(unit.isEmpty ? .center : .trailing)
                        .font(AppFont.mono(14, weight: .semibold))
                        .foregroundStyle(Palette.ink)
                        .frame(width: unit.isEmpty ? 44 : 46)
                    if !unit.isEmpty {
                        Text(unit)
                            .font(AppFont.mono(14, weight: .semibold))
                            .foregroundStyle(Palette.inkSoft)
                            .accessibilityHidden(true)
                    }
                }
                .frame(minWidth: 70)
                StepperButton(title: "\(label) erhöhen", systemImage: "plus",
                              isEnabled: value < range.upperBound, accent: accent) { change(by: $0) }
            }
            .padding(3)
            .insetBox(cornerRadius: Metrics.stepperRadius)
        }
    }

    private func change(by multiplier: Int) {
        clampedValue.wrappedValue = value + multiplier * step
    }
}
