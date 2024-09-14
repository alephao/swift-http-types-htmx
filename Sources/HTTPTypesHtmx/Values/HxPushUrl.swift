/// Possible values for the HX-Push-URL header
public enum HxPushUrl: Equatable, CustomStringConvertible {
  /// prevents the browser’s history from being updated.
  case `false`

  /// A URL to be pushed into the location bar. This may be relative or absolute, as per [`history.pushState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/pushState).
  case url(String)

  public var description: String {
    switch self {
    case .false: return "false"
    case .url(let raw): return raw
    }
  }
}
