// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CodebaseAuditor",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2")
    ],
    targets: [
        .executableTarget(
            name: "CodebaseAuditor",
            dependencies: [
                "CodebaseCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(name: "CodebaseCore", dependencies: [
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "SwiftParser", package: "swift-syntax")
        ]),
        .testTarget(name: "CodebaseCoreTests", dependencies: ["CodebaseCore"])
    ]
)
