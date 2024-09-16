# swift-http-types-htmx
[![CI](https://github.com/alephao/swift-http-types-htmx/actions/workflows/ci.yml/badge.svg)](https://github.com/alephao/swift-http-types-htmx/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/alephao/swift-http-types-htmx/graph/badge.svg?token=Ef5FszDA3Y)](https://codecov.io/gh/alephao/swift-http-types-htmx)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Falephao%2Fswift-http-types-htmx%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/alephao/swift-http-types-htmx)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Falephao%2Fswift-http-types-htmx%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/alephao/swift-http-types-htmx)

[HTMX](https://htmx.org) extensions for [`apple/swift-http-types`](https://github.com/apple/swift-http-types).

The package provides extensions for:

- `HTTPField.Name` initializers, e.g.: `HTTPField.Name.hxLocation` = `'HX-Location'`
- `HTTPField` initializers e.g.: `HTTPField.hxLocation('/path')` = `HX-Location: /path`
- `HTTPFields` getters e.g.: `HTTPFields.hxRequest: Bool`, `HTTPFields.hxLocation: String?`

It also provides HTMX documentation in-code:

![](/Resources/ss-xcode-doc.png)

### Usage

```swift
import HTTPTypes 
import HTTPTypesHtmx

// Creating HTTPFields

let headersViaArray = HTTPFields([
  .hxRetarget("#myDiv"),
  .hxReswap(.outerHTML),
])

let headersViaDictionary: HTTPFields = [
  .hxRetarget: "#myDiv",
  .hxReswap: HxSwap.outerHTML,
] 

// Getting values from HTTPFields
let exampleRequestHeaders = HTTPFields([
  .hxBoosted(),
  .hxRequest(),
  .hxTarget(id: "myDiv")
])

requestHeaders.hxBoosted // true
requestHeaders.hxRequest // true
requestHeaders.hxTarget  // "myDiv"
```

## Examples

There is an [example project](Examples) of a server using the [Hummingbird Framework](http://github.com/hummingbird-project/hummingbird) with a few exampels on how to use HTMX response headers to drive the application.

There are also tests for all handlers, demonstrating how this library can be used to mock HTMX requests for testing purposes.

## Installation

Add the dependency to Package.swift

```swift
dependencies: [
  .package(url: "https://github.com/alephao/swift-http-types-htmx.git", from: "0.3.0")
],
```

Add the products you want to use to the target dependencies

```swift
.target(
  name: "MyTarget",
  dependencies: [
    .product(name: "HTTPTypesHtmx", package: "swift-htmx"),
  ]
)
```
