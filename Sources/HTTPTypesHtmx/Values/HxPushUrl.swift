/// Possible values for the HX-Push-URL header
public struct HxPushUrl: Equatable, CustomStringConvertible {
  public let description: String

  init(_ description: String) {
    self.description = description
  }
}

extension HxPushUrl {
  /// prevents the browser’s history from being updated.
  public static let `false` = HxPushUrl("false")

  /// A URL to be pushed into the location bar. This may be relative or absolute, as per [`history.pushState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/pushState).
  public static func url(_ string: String) -> HxPushUrl {
    return HxPushUrl(string)
  }
}
