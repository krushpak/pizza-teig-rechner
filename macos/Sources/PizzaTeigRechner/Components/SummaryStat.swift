/// Kennzahl im Überblick, z. B. „Hydration – 60,0 %“.
struct SummaryStat: Identifiable, Equatable {
    let label: String
    let value: String
    var id: String { label }
}
