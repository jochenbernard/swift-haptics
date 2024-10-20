// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftHaptics",
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
