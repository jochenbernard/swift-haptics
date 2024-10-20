// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftHaptics",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v15),
        .tvOS(.v13),
        .visionOS(.v1),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "SwiftHaptics",
            targets: ["SwiftHaptics"]
        )
    ],
    targets: [
        .target(name: "SwiftHaptics"),
        .testTarget(
            name: "SwiftHapticsTests",
            dependencies: ["SwiftHaptics"]
        )
    ]
)
