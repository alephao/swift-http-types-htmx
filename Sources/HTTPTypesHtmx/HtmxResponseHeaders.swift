import HTTPTypes

// MARK: - Initializers for HTMX Response Header Names
extension HTTPField.Name {
  /// HX-Location Response Header
  ///
  /// allows you to do a client-side redirect that does not do a full page reload
  ///
  /// [https://htmx.org/headers/hx-location/](https://htmx.org/headers/hx-location/)
  public static var hxLocation: Self { .init("HX-Location")! }

  /// HX-Push-Url Response Header
  ///
  /// pushes a new url into the history stack
  ///
  /// [https://htmx.org/headers/hx-push-url/](https://htmx.org/headers/hx-push-url/)
  public static var hxPushUrl: Self { .init("HX-Push-Url")! }

  /// HX-Redirect Response Header
  ///
  /// can be used to do a client-side redirect to a new location
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxRedirect: Self { .init("HX-Redirect")! }

  /// HX-Refresh Response Header
  ///
  /// if set to “true” the client-side will do a full refresh of the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxRefresh: Self { .init("HX-Refresh")! }

  /// HX-Replace-Url Response Header
  ///
  /// replaces the current URL in the location bar
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxReplaceUrl: Self { .init("HX-Replace-Url")! }

  /// HX-Reswap Response Header
  ///
  /// allows you to specify how the response will be swapped. See hx-swap for possible values
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxReswap: Self { .init("HX-Reswap")! }

  /// HX-Retarget Response Header
  ///
  /// a CSS selector that updates the target of the content update to a different element on the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxRetarget: Self { .init("HX-Retarget")! }

  /// HX-Reselect Response Header
  ///
  /// a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing hx-select on the triggering element
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxReselect: Self { .init("HX-Reselect")! }

  /// HX-Trigger-After-Settle Response Header
  ///
  /// allows you to trigger client-side events after the settle step
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxTriggerAfterSettle: Self { .init("HX-Trigger-After-Settle")! }

  /// HX-Trigger-After-Swap Response Header
  ///
  /// allows you to trigger client-side events after the swap step
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static var hxTriggerAfterSwap: Self { .init("HX-Trigger-After-Swap")! }
}

// MARK: - Initializers for HTMX Response Header
extension HTTPField {
  /// Creates an "HX-Location: \(location)" response header
  ///
  /// allows you to do a client-side redirect that does not do a full page reload
  ///
  /// This response header can be used to trigger a client side redirection without reloading the whole page. Instead of changing the page’s location it will act like following a [`hx-boost` link](https://htmx.org/attributes/hx-boost/), creating a new history entry, issuing an [`ajax` request](https://htmx.org/api/#ajax) to the value of the header and pushing the path into history.
  ///
  /// A sample response would be:
  ///
  /// ```
  /// HX-Location: /test
  /// ```
  ///
  /// Which would push the client to test as if the user had clicked on `<a href="/test" hx-boost="true">`
  ///
  /// If you want to redirect to a specific target on the page rather than the default of document.body, you can pass more details along with the event, by using JSON for the value of the header:
  ///
  /// ```
  /// HX-Location: {"path":"/test2", "target":"#testdiv"}
  /// ```
  ///
  /// Path is required and is the url to load the response from. The rest of the data mirrors the ajax api context, which is:
  ///
  /// * `source` - the source element of the request
  /// * `event` - an event that “triggered” the request
  /// * `handler` - a callback that will handle the response HTML
  /// * `target` - the target to swap the response into
  /// * `swap` - how the response will be swapped in relative to the target
  /// * `values` - values to submit with the request
  /// * `headers` - headers to submit with the request
  /// * `select` - allows you to select the content you want swapped from a response
  ///
  /// [https://htmx.org/headers/hx-location/](https://htmx.org/headers/hx-location/)
  public static func hxLocation(_ location: String) -> Self {
    // TODO: Ajax API Context
    .init(name: .hxLocation, value: location)
  }

  /// Creates an "HX-Push-Url: \(value)" response header
  ///
  /// The `HX-Push-Url` header allows you to push a URL into the [browser location](https://developer.mozilla.org/en-US/docs/Web/API/History_API) history. This creates a new history entry, allowing navigation with the browser’s back and forward buttons. This is similar to the [`hx-push-url` attribute](https://htmx.org/attributes/hx-push-url/).
  ///
  /// If present, this header overrides any behavior defined with attributes.
  ///
  /// The possible values for this header are:
  ///
  /// 1. A URL to be pushed into the location bar. This may be relative or absolute, as per [`history.pushState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/pushState).
  /// 2. false, which prevents the browser’s history from being updated.
  ///
  /// [https://htmx.org/headers/hx-push-url/](https://htmx.org/headers/hx-push-url/)
  public static func hxPushUrl(_ value: HxPushUrl) -> Self {
    .init(name: .hxPushUrl, value: value.description)
  }

  /// Creates an "HX-Redirect: \(location)" response header
  ///
  /// can be used to do a client-side redirect to a new location
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static func hxRedirect(_ location: String) -> Self {
    .init(name: .hxRedirect, value: location)
  }

  /// Creates an "HX-Refresh: true" response header
  ///
  /// if set to “true” the client-side will do a full refresh of the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static func hxRefresh() -> Self { .init(name: .hxRefresh, value: "true") }

  /// Creates an "HX-Replace-Url: \(value)" response header
  ///
  /// The `HX-Replace-Url` header allows you to replace the current URL in the browser location history. This does not create a new history entry; in effect, it removes the previous current URL from the browser’s history. This is similar to the [`hx-replace-url` attribute](https://htmx.org/attributes/hx-replace-url/).
  ///
  /// If present, this header overrides any behavior defined with attributes.
  ///
  /// The possible values for this header are:
  ///
  /// 1. A URL to replace the current URL in the location bar. This may be relative or absolute, as per [`history.replaceState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/replaceState), but must have the same origin as the current URL.
  /// 2. false, which prevents the browser’s current URL from being updated.
  ///
  /// [https://htmx.org/headers/hx-replace-url/](https://htmx.org/headers/hx-replace-url/)
  public static func hxReplaceUrl(_ value: HxReplaceUrl) -> Self {
    .init(name: .hxReplaceUrl, value: value.description)
  }

  /// Creates an "HX-Reswap: \(value)" response header
  ///
  /// allows you to specify how the response will be swapped. See [`hx-swap`](https://htmx.org/attributes/hx-swap/) for possible values
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static func hxReswap(_ value: HxSwap) -> Self {
    .init(name: .hxReswap, value: value.description)
  }

  /// Creates an "HX-Retarget: \(cssSelector)" response header
  ///
  /// a CSS selector that updates the target of the content update to a different element on the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static func hxRetarget(_ cssSelector: String) -> Self {
    .init(name: .hxRetarget, value: cssSelector)
  }

  /// Creates an "HX-Reselect: \(cssSelector)" response header
  ///
  /// a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing [`hx-select`](https://htmx.org/attributes/hx-select/) on the triggering element
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public static func hxReselect(_ cssSelector: String) -> Self {
    .init(name: .hxReselect, value: cssSelector)
  }

  /// Creates an "HX-Trigger-After-Settle: \(value)" response header
  ///
  /// allows you to trigger client-side events after the settle step
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public static func hxTriggerAfterSettle(_ value: String) -> Self {
    .init(name: .hxTriggerAfterSettle, value: value)
  }

  /// Creates an "HX-Trigger-After-Swap: \(value)" response header
  ///
  /// allows you to trigger client-side events after the swap step
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public static func hxTriggerAfterSwap(_ value: String) -> Self {
    .init(name: .hxTriggerAfterSwap, value: value)
  }
}

// MARK: - HTMX Getters for HTTPFields
extension HTTPFields {
  /// Returns the value of an HX-Location response header
  ///
  /// HX-Location allows you to do a client-side redirect that does not do a full page reload
  ///
  /// [https://htmx.org/headers/hx-location/](https://htmx.org/headers/hx-location/)
  public var hxLocation: String? {
    return self[.hxLocation]
  }

  /// Returns the value of an HX-Push-Url response header
  ///
  /// HX-Push-Url pushes a new url into the history stack
  ///
  /// [https://htmx.org/headers/hx-push-url/](https://htmx.org/headers/hx-push-url/)
  public var hxPushUrl: HxPushUrl? {
    self[.hxPushUrl].map(HxPushUrl.init(_:))
  }

  /// Returns the value of an HX-Redirect response header
  ///
  /// HX-Redirect can be used to do a client-side redirect to a new location
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public var hxRedirect: String? {
    return self[.hxRedirect]
  }

  /// Returns the value of an HX-Refresh response header
  ///
  /// if HX-Refresh is set to “true” the client-side will do a full refresh of the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public var hxRefresh: Bool {
    return self[.hxRefresh] == "true"
  }

  /// Returns the value of an HX-Replace-Url response header
  ///
  /// HX-Replace-Url replaces the current URL in the location bar
  ///
  /// [https://htmx.org/headers/hx-replace-url/](https://htmx.org/headers/hx-replace-url/)
  public var hxReplaceUrl: HxReplaceUrl? {
    self[.hxReplaceUrl].map(HxReplaceUrl.init(_:))
  }

  /// Returns the value of an HX-Reswap response header
  ///
  /// HX-Reswap allows you to specify how the response will be swapped. See [`hx-swap`](https://htmx.org/attributes/hx-swap/) for possible values
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public var hxReswap: HxSwap? {
    return self[.hxReswap].map(HxSwap.init(_:))
  }

  /// Returns the value of an HX-Retarget response header
  ///
  /// HX-Retarget is a CSS selector that updates the target of the content update to a different element on the page
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public var hxRetarget: String? {
    return self[.hxRetarget]
  }

  /// Returns the value of an HX-Reselect response header
  ///
  /// HX-Reselect is a CSS selector that allows you to choose which part of the response is used to be swapped in. Overrides an existing [`hx-select`](https://htmx.org/attributes/hx-select/) on the triggering element
  ///
  /// [https://htmx.org/reference/#response_headers](https://htmx.org/reference/#response_headers)
  public var hxReselect: String? {
    return self[.hxReselect]
  }

  /// Returns the value of an HX-Trigger-After-Settle response header
  ///
  /// HX-Trigger-After-Settle allows you to trigger client-side events after the settle step
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public var hxTriggerAfterSettle: String? {
    return self[.hxTriggerAfterSettle]
  }

  /// Returns the value of an HX-Trigger-After-Swap response header
  ///
  /// HX-Trigger-After-Swap allows you to trigger client-side events after the swap step
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public var hxTriggerAfterSwap: String? {
    return self[.hxTriggerAfterSwap]
  }
}
