// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-http-types-htmx-examples",
  platforms: [.macOS(.v14)],
  products: [
    .executable(name: "App", targets: ["App"])
  ],
  dependencies: [
    .package(url: "https://github.com/hummingbird-project/hummingbird.git", from: "2.0.0"),
    .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    .package(url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.12.0"),
    .package(url: "https://github.com/pointfreeco/swift-dependencies.git", from: "1.4.0"),
    .package(name: "swift-http-types-htmx", path: "../"),
  ],
  targets: [
    .executableTarget(
      name: "App",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "Hummingbird", package: "hummingbird"),
        .product(name: "HTTPTypesHtmx", package: "swift-http-types-htmx"),
        .product(name: "Dependencies", package: "swift-dependencies"),
      ],
      path: "Sources/App"
    ),
    .testTarget(
      name: "AppTests",
      dependencies: [
        "App",
        .product(name: "HummingbirdTesting", package: "hummingbird"),
        .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
        .product(name: "InlineSnapshotTesting", package: "swift-snapshot-testing"),
        .product(name: "Dependencies", package: "swift-dependencies"),
      ],
      path: "Tests/AppTests"
    ),
  ]
)
