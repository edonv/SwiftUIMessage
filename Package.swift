// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIMessage",
    platforms: [
        .iOS(.v13),
        .macCatalyst(.v13),
        .visionOS(.v1),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftUIMessage",
            targets: ["SwiftUIMessage"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftUIMessage",
            dependencies: [],
            resources: [.copy("../PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "SwiftUIMessageTests",
            dependencies: ["SwiftUIMessage"]
        ),
    ]
)
