/// Possible values for HX-Reswap header
///
/// [https://htmx.org/attributes/hx-swap/](https://htmx.org/attributes/hx-swap/)
public struct HxSwap: Equatable, CustomStringConvertible, ExpressibleByStringLiteral {
  public let description: String

  public init(_ description: String) {
    self.description = description
  }

  public init(stringLiteral value: StringLiteralType) {
    self.description = value
  }
}

extension HxSwap {
  /// Replace the inner html of the target element
  public static let innerHTML = HxSwap("innerHTML")

  /// Replace the entire target element with the response
  public static let outerHTML = HxSwap("outerHTML")

  /// Insert the response before the target element
  public static let beforebegin = HxSwap("beforebegin")

  /// Insert the response before the first child of the target element
  public static let afterbegin = HxSwap("afterbegin")

  /// Insert the response after the last child of the target element
  public static let beforeend = HxSwap("beforeend")

  /// Insert the response after the target element
  public static let afterend = HxSwap("afterend")

  /// Deletes the target element regardless of the response
  public static let delete = HxSwap("delete")

  /// Does not append content from response (out of band items will still be processed).
  public static let none = HxSwap("none")
}
