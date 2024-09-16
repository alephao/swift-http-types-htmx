/// Possible values for the HX-Replace-URL header
public struct HxReplaceUrl: Equatable, CustomStringConvertible {
  public let description: String

  init(_ description: String) {
    self.description = description
  }
}

extension HxReplaceUrl {
  /// false, prevents the browser’s current URL from being updated.
  public static let `false` = HxReplaceUrl("false")

  /// A URL to replace the current URL in the location bar. This may be relative or absolute, as per [`history.replaceState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/replaceState), but must have the same origin as the current URL.
  public static func url(_ string: String) -> HxReplaceUrl {
    return HxReplaceUrl(string)
  }
}
