// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftHaptics",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v15),
        .tvOS(.v15),
        .visionOS(.v1)
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
