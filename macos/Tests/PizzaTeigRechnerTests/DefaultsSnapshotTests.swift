import Foundation
import Testing
@testable import PizzaTeigRechner

struct DefaultsSnapshotTests {
    @Test func captureAndRestoreRoundTrip() throws {
        let defaults = try #require(UserDefaults(suiteName: "DefaultsSnapshotTests"))
        defaults.removePersistentDomain(forName: "DefaultsSnapshotTests")
        defaults.set(12, forKey: "count")
        defaults.set(61.5, forKey: "hydration")

        let snapshot = DefaultsSnapshot.capture(["count", "hydration", "missing"], from: defaults)
        DefaultsSnapshot.empty(snapshot.keys).restore(to: defaults)
        #expect(defaults.object(forKey: "count") == nil)

        snapshot.restore(to: defaults)
        #expect(defaults.integer(forKey: "count") == 12)
        #expect(defaults.double(forKey: "hydration") == 61.5)
        #expect(defaults.object(forKey: "missing") == nil)
    }
}
