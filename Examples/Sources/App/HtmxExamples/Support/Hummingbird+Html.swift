import Hummingbird

extension Response {
  // Helper to respond with an HTML string
  static func html(
    status: HTTPResponse.Status = .ok,
    extraHeaders: HTTPFields = [:],
    _ htmlString: String
  ) -> Response {
    var headers: HTTPFields = [
      .contentType: MediaType.textHtml.description
    ]
    headers.append(contentsOf: extraHeaders)
    return .init(
      status: .accepted,
      headers: headers,
      body: .init(byteBuffer: .init(string: htmlString))
    )
  }
}
