import SwiftUI

/// Schieberegler mit eintippbarem Wert und optionalem Zurücksetzen.
struct SliderField: View {
    let label: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double
    var unit = "%"
    var fractionDigits = 0
    var accent: Color = Palette.passata
    var hint: String? = nil
    var onReset: (() -> Void)? = nil

    /// Getippte Werte: auf die angezeigten Nachkommastellen runden und begrenzen.
    private var typedValue: Binding<Double> {
        Binding(get: { value }, set: { newValue in
            let factor = pow(10, Double(fractionDigits))
            value = min(max((newValue * factor).rounded() / factor, range.lowerBound), range.upperBound)
        })
    }

    /// Ohne `step:` am Slider, damit macOS keine Tick-Marks zeichnet – gerundet wird hier.
    private var slidValue: Binding<Double> {
        Binding(get: { value }, set: { value = ($0 / step).rounded() * step })
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text(label)
                    .font(AppFont.body(13.5, weight: .medium))
                    .foregroundStyle(Palette.ink)
                Spacer(minLength: 8)
                if let onReset {
                    Button(action: onReset) {
                        Label("Auf Empfehlung zurücksetzen", systemImage: "arrow.counterclockwise")
                            .labelStyle(.iconOnly)
                            .font(.system(size: 12, weight: .semibold))
                            .frame(width: 24, height: 24)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(Palette.inkSoft)
                    .help("Auf Empfehlung zurücksetzen")
                }
                HStack(spacing: 3) {
                    TextField(label, value: typedValue, format: Fmt.decimalInput(fractionDigits))
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.trailing)
                        .font(AppFont.mono(14, weight: .semibold))
                        .foregroundStyle(accent)
                        .frame(width: fractionDigits > 0 ? 44 : 34)
                    Text(unit)
                        .font(AppFont.mono(14, weight: .semibold))
                        .foregroundStyle(accent)
                        .accessibilityHidden(true)
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .insetBox(cornerRadius: Metrics.fieldRadius)
            }
            Slider(value: slidValue, in: range)
                .tint(accent)
                .labelsHidden()
                .accessibilityLabel(label)
            if let hint {
                Hint(hint)
            }
        }
    }
}
