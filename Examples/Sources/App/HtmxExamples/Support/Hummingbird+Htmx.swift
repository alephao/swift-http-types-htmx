import HTTPTypesHtmx
import Hummingbird

extension Request {
  // Helper to check if a request was made by HTMX
  var isHtmxRequest: Bool {
    return headers[.hxRequest] == "true"
  }
}
