/// Possible values for HX-Reswap header
///
/// [https://htmx.org/attributes/hx-swap/](https://htmx.org/attributes/hx-swap/)
public enum HxSwap: RawRepresentable, Equatable, CustomStringConvertible {
  public typealias RawValue = String

  /// Replace the inner html of the target element
  case innerHTML

  /// Replace the entire target element with the response
  case outerHTML

  /// Insert the response before the target element
  case beforebegin

  /// Insert the response before the first child of the target element
  case afterbegin

  /// Insert the response after the last child of the target element
  case beforeend

  /// Insert the response after the target element
  case afterend

  /// Deletes the target element regardless of the response
  case delete

  /// Does not append content from response (out of band items will still be processed).
  case none

  /// Fallback if you need a value other than the ones avaiable
  case raw(String)

  public var rawValue: String {
    switch self {
    case .innerHTML: return "innerHTML"
    case .outerHTML: return "outerHTML"
    case .beforebegin: return "beforebegin"
    case .afterbegin: return "afterbegin"
    case .beforeend: return "beforeend"
    case .afterend: return "afterend"
    case .delete: return "delete"
    case .none: return "none"
    case .raw(let string): return string
    }
  }

  public var description: String { rawValue }

  public init(rawValue: String) {
    switch rawValue {
    case "innerHTML": self = .innerHTML
    case "outerHTML": self = .outerHTML
    case "beforebegin": self = .beforebegin
    case "afterbegin": self = .afterbegin
    case "beforeend": self = .beforeend
    case "afterend": self = .afterend
    case "delete": self = .delete
    case "none": self = .none
    default: self = .raw(rawValue)
    }
  }
}
