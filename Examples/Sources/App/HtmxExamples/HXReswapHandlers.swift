import Foundation
import HTTPTypesHtmx
import Hummingbird

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Route {
  static let hxReswapHttp = Route(.get, "/examples/hx-reswap")
}

@Sendable func hxReswapHandler(_ req: Request) -> Response {
  let timestamp = String(Date.now.timeIntervalSince1970)
  let inputId = "timestamp"
  let inputSelector = "#timestamp"
  let input = """
    <input id="\(inputId)" value="\(timestamp)" readonly />
    """

  if req.isHtmxRequest {
    return .html(
      extraHeaders: HTTPFields([
        .hxRetarget(inputSelector),
        .hxReswap(.outerHTML),
      ]),
      input
    )
  }

  return .html(
    htmlLayout(
      """
      <div>
        <h2>HX-Reswap Example</h2>
        <p>This example uses HX-Reswap and HX-Retarget headers to update the input with the server's current timestamp</p>
        <div>
          <button
            hx-get="\(Route.hxReswapHttp.path)"
            hx-swap="none"
          >Swap via HX-Reswap and HX-Retarget</button>
          <br>
          <br>
          \(input)
        </div>
      </div>
      """
    )
  )
}
