// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PizzaTeigRechner",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "PizzaTeigRechner",
            path: "Sources/PizzaTeigRechner"
        ),
        .testTarget(
            name: "PizzaTeigRechnerTests",
            dependencies: ["PizzaTeigRechner"],
            path: "Tests/PizzaTeigRechnerTests"
        ),
    ]
)
