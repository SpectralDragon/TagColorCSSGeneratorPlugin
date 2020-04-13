// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TagColorCSSGeneratorPlugin",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "TagColorCSSGeneratorPlugin",
            targets: ["TagColorCSSGeneratorPlugin"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.4.0"),
        .package(url: "https://github.com/SpectralDragon/PublishColorUtils.git", from: "0.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "TagColorCSSGeneratorPlugin",
            dependencies: ["Publish", "PublishColorUtils"]),
        .testTarget(
            name: "TagColorCSSGeneratorPluginTests",
            dependencies: ["TagColorCSSGeneratorPlugin"]),
    ]
)
