import Foundation
import HTTPTypesHtmx
import Hummingbird

#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif

extension Route {
  static let hxTrigger = Route(.get, "/examples/hx-trigger")
  static let hxTriggerAlert = Route(.post, "/examples/hx-trigger")
}

@Sendable func hxTriggerHandler(_ req: Request) -> Response {
  .html(
    htmlLayout(
      """
      <div>
        <h2>HX-Trigger Example</h2>
        <p>This example uses HX-Trigger to trigger a client-side event that shows an alert</p>
        <div>
          <button
            hx-post="\(Route.hxTriggerAlert.path)"
            hx-swap="none"
          >Trigger</button>
        </div>
        <script>
          document.body.addEventListener("showMessage", function(evt){
              alert(evt.detail.value);
          })
        </script>
      </div>
      """
    )
  )
}

@Sendable func hxTriggerAlertHandler(_ req: Request) -> Response {
  guard req.isHtmxRequest else {
    return Response(status: .badRequest)
  }

  return Response(
    status: .ok,
    headers: HTTPFields([
      .hxTrigger(
        event: """
          {"showMessage":"This alert was triggered by HX-Trigger"}
          """
      )
    ])
  )
}
