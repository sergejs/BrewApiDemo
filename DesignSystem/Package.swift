// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Sergejs/ServiceContainer.git", .branch("main")),
        .package(url: "https://github.com/Sergejs/LoadableImage.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: [
                .product(name: "ServiceContainer", package: "ServiceContainer"),
                .product(name: "LoadableImageView", package: "LoadableImage"),
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
