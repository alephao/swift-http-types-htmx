import HTTPTypes

// MARK: - Initializers for HTMX Request Header Names
extension HTTPField.Name {
  /// HX-Boosted Request Header
  ///
  /// indicates that the request is via an element using hx-boost
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxBoosted: Self { .init("HX-Boosted")! }

  /// HX-Current-URL Request Header
  ///
  /// the current URL of the browser
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxCurrentURL: Self { .init("HX-Current-URL")! }

  /// HX-History-Restore-Request Request Header
  ///
  /// “true” if the request is for history restoration after a miss in the local history cache
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxHistoryRestoreRequest: Self { .init("HX-History-Restore-Request")! }

  /// HX-Prompt Request Header
  ///
  /// the user response to an hx-prompt
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxPrompt: Self { .init("HX-Prompt")! }

  /// HX-Request Request Header
  ///
  /// always "true" (indicates the request was made by HTMX))
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxRequest: Self { .init("HX-Request")! }

  /// HX-Target Request Header
  ///
  /// the id of the target element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxTarget: Self { .init("HX-Target")! }

  /// HX-Trigger-Name Request Header
  ///
  /// the name of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static var hxTriggerName: Self { .init("HX-Trigger-Name")! }
}

// MARK: - Initializers for HTMX Request Header (useful for mocking)
extension HTTPField {
  /// Creates an "HX-Boosted: true" request header
  ///
  /// HX-Boosted indicates that the request is via an element using hx-boost
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxBoosted() -> Self { .init(name: .hxBoosted, value: "true") }

  /// Creates an "HX-Current-URL: \(url)" request header
  ///
  /// HX-Current-URL contains the current URL of the browser
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxCurrentURL(_ url: String) -> Self { .init(name: .hxCurrentURL, value: url) }

  /// Creates an "HX-History-Restore-Request: true" request header
  ///
  /// HX-History-Restore-Request is “true” if the request is for history restoration after a miss in the local history cache
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxHistoryRestoreRequest() -> Self {
    .init(name: .hxHistoryRestoreRequest, value: "true")
  }

  /// Creates an "HX-Prompt: {userResponse}" request header
  ///
  /// HX-Prompt contains the user response to an hx-prompt
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxPrompt(_ userResponse: String) -> Self {
    .init(name: .hxPrompt, value: userResponse)
  }

  /// Creates an "HX-Request: true" request header
  ///
  /// HX-Request is "true" when a request is made using htmx
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxRequest() -> Self { .init(name: .hxRequest, value: "true") }

  /// Creates an "HX-Target: {targetElementId}" request header
  ///
  /// HX-Target contains the id of the target element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxTarget(_ targetElementId: String) -> Self {
    .init(name: .hxTarget, value: targetElementId)
  }

  /// Creates an "HX-Trigger-Name: {triggerName}"
  ///
  /// HX-Trigger-Name contains the name of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxTriggerName(_ triggerName: String) -> Self {
    .init(name: .hxTriggerName, value: triggerName)
  }
}

// MARK: - HTMX Getters for HTTPFields
extension HTTPFields {
  /// Returns true if the request is via an element using hx-boost
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxBoosted: Bool {
    self[.hxBoosted] == "true"
  }

  /// Returns the current URL of the browser
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxCurrentURL: String? {
    self[.hxCurrentURL]
  }

  /// Returns true if the request is for history restoration after a miss in the local history cache
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxHistoryRestoreRequest: Bool {
    self[.hxHistoryRestoreRequest] == "true"
  }

  /// Returns the user response to an hx-prompt
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxPrompt: String? {
    self[.hxPrompt]
  }

  /// Returns true if the request was made using htmx
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxRequest: Bool {
    self[.hxRequest] == "true"
  }

  /// Returns the id of the target element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxTarget: String? {
    self[.hxTarget]
  }

  /// Returns the name of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public var hxTriggerName: String? {
    self[.hxTriggerName]
  }
}
