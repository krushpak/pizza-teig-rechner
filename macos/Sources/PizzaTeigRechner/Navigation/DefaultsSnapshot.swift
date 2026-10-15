import Foundation

/// Zustand einiger UserDefaults-Schlüssel, als Property-List gespeichert, damit er
/// `Sendable` ist und sicher in Undo-Aktionen eingefangen werden kann.
struct DefaultsSnapshot: Sendable, Equatable {
    let keys: [String]
    /// Property-List eines `[String: Any]`; fehlende Schlüssel bedeuten „Standardwert“.
    let values: Data

    static func empty(_ keys: [String]) -> DefaultsSnapshot {
        DefaultsSnapshot(keys: keys, values: Data())
    }

    static func capture(_ keys: [String], from defaults: UserDefaults = .standard) -> DefaultsSnapshot {
        var dictionary: [String: Any] = [:]
        for key in keys {
            if let value = defaults.object(forKey: key) { dictionary[key] = value }
        }
        let data = (try? PropertyListSerialization.data(fromPropertyList: dictionary, format: .binary, options: 0)) ?? Data()
        return DefaultsSnapshot(keys: keys, values: data)
    }

    func restore(to defaults: UserDefaults = .standard) {
        let decoded = values.isEmpty ? nil : try? PropertyListSerialization.propertyList(from: values, format: nil)
        let dictionary = decoded as? [String: Any] ?? [:]
        for key in keys {
            if let value = dictionary[key] {
                defaults.set(value, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
