# swift-http-types-htmx

This package extends [`apple/swift-http-types`](https://github.com/apple/swift-http-types) to support [HTMX](https://htmx.org) request and response headers.

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

Check the [hummingbird](http://github.com/hummingbird-project/hummingbird) example project [here](Examples)

## Installation

Add the dependency to Package.swift

```swift
dependencies: [
  .package(url: "https://github.com/alephao/swift-http-types-htmx.git", from: "0.1.0")
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
