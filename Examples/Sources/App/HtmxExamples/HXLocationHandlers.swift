import Foundation
import HTTPTypesHtmx
import Hummingbird

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Route {
  static let hxLocation = Route(.get, "/examples/hx-location")
  static let hxLocationSubmit = Route(.post, "/examples/hx-location")
  static let hxLocationB = Route(.get, "/examples/hx-location-b")
  static let hxLocationBSubmit = Route(.post, "/examples/hx-location-b")
}

@Sendable func hxLocationHandler(_ req: Request) -> Response {
  .html(
    htmlLayout(
      """
      <div>
        <h2>HX-Location Example</h2>
        <p>Pressing the button will do client-side redirection via the HX-Location header</p>
        <div>
          <button
            hx-post="\(Route.hxLocationSubmit.path)"
          >Submit</button>
        </div>
      </div>
      """
    )
  )
}

@Sendable func hxLocationSubmitHandler(_ req: Request) -> Response {
  if req.isHtmxRequest {
    return Response(
      status: .ok,
      headers: HTTPFields([
        .hxLocation(Route.hxLocationB.path)
      ])
    )
  }
  return Response(status: .badRequest)
}

@Sendable func hxLocationBHandler(_ req: Request) -> Response {
  .html(
    htmlLayout(
      """
      <div>
        <h2>Redirected!</h2>
        <p>You got redirected here via HX-Location header, click the button to be redirected back.</p>
        <div>
          <button
            hx-post="\(Route.hxLocationBSubmit.path)"
          >Submit</button>
        </div>
      </div>
      """
    )
  )
}

@Sendable func hxLocationBSubmitHandler(_ req: Request) -> Response {
  if req.isHtmxRequest {
    return Response(
      status: .ok,
      headers: HTTPFields([
        .hxLocation(Route.hxLocation.path)
      ])
    )
  }
  return Response(status: .badRequest)
}
