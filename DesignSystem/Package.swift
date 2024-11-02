// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: []
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]
        ),
    ]
)

