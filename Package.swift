// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CodebaseAuditor",
    platforms: [.macOS(.v13)],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2")
    ],
    targets: [
        .executableTarget(
            name: "CodebaseAuditor",
            dependencies: ["CodebaseCore"]
        ),
        .target(name: "CodebaseCore", dependencies: [
            .product(name: "SwiftSyntax", package: "swift-syntax"),
            .product(name: "SwiftParser", package: "swift-syntax")
        ]),
        .testTarget(name: "CodebaseCoreTests", dependencies: ["CodebaseCore"])
    ]
)
