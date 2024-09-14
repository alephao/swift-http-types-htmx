/// Possible values for the HX-Replace-URL header
public enum HxReplaceUrl: Equatable, CustomStringConvertible {
  /// false, which prevents the browser’s current URL from being updated.
  case `false`

  /// A URL to replace the current URL in the location bar. This may be relative or absolute, as per [`history.replaceState()`](https://developer.mozilla.org/en-US/docs/Web/API/History/replaceState), but must have the same origin as the current URL.
  case url(String)

  public var description: String {
    switch self {
    case .false: return "false"
    case .url(let raw): return raw
    }
  }
}
