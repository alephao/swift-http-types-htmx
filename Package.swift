// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "swift-http-types-htmx",
  products: [
    .library(name: "HTTPTypesHtmx", targets: ["HTTPTypesHtmx"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-http-types.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "HTTPTypesHtmx",
      dependencies: [
        .product(name: "HTTPTypes", package: "swift-http-types")
      ]
    )
  ]
)
