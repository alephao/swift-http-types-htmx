import Foundation
import HTTPTypesHtmx
import Hummingbird

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Route {
  static let swapHttp = Route(.get, "/examples/swap-http")
}

func registerSwapRoutes(router: Router<AppRequestContext>) {
  router.on(route: .swapHttp, use: swapHttpHandler)
}

@Sendable func swapHttpHandler(_ req: Request) -> Response {
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
        <h2>Swap via HX-Reswap and HX-Retarget headers</h2>
        <p>This example uses HX-Reswap and HX-Retarget headers to update the input with the server's current timestamp</p>
        <div>
          <button
            hx-get="\(Route.swapHttp.path)"
            hx-swap="none"
          >Swap via HX-Reswap and Hx-Retarget</button>
          <br>
          <br>
          \(input)
        </div>
      </div>
      """
    )
  )
}
