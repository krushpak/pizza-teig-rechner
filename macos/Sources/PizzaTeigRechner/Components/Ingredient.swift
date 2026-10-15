/// Eine Zeile in einer Zutatenliste.
struct Ingredient: Identifiable, Equatable {
    let name: String
    let amount: String
    /// Textangabe statt Menge (z. B. „gesamter Inhalt aus dem Glas“) – wird nicht in der Zahlenschrift gesetzt.
    var isNote = false
    var id: String { name }
}
