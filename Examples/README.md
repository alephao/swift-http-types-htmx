# swift-htmx-examples

This project provides examples of `swift-htmx` usage

## Getting Started

Start the server by running `swift run App` in the project root or run the project on Xcode

## Examples

- (HX-Location)[Sources/App/HtmxExamples/HXLocationHandlers.swift] - Do a client side redirect via `HX-Location`
- (HX-Reswap)[Sources/App/HtmxExamples/HXReswapHandlers.swift] - Swap an element via `HX-Reswap`
- (HX-Trigger)[Sources/App/HtmxExamples/HXTriggerHandlers.swift] - Trigger a client-side event via `HX-Trigger`

The (AppTests.swift)[Tests/AppTests/AppTests.swif] contains a tests for all the request handlers, demonstrating mocked htmx requests and its how the response looks like in an HTTP Response

