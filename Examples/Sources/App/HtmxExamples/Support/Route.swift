import Hummingbird

struct Route {
  let path: String
  let routerPath: RouterPath
  // HTML forms can only send GET and POST
  let method: Method
  let httpMethod: HTTPRequest.Method

  init(_ method: Method, _ path: String) {
    self.path = path
    self.routerPath = RouterPath(path)
    self.method = method
    self.httpMethod =
      switch method {
      case .get: .get
      case .post: .post
      }
  }

  enum Method: String {
    case get
    case post
  }
}

// Helpers for Hummingbird
extension RouterMethods {
  @discardableResult func on(
    route: Route,
    use closure: @Sendable @escaping (Request, Context) async throws -> some ResponseGenerator
  ) -> Self {
    self.on(route.routerPath, method: route.httpMethod, use: closure)
  }

  @discardableResult func on(
    route: Route,
    use closure: @Sendable @escaping (Request) async throws -> some ResponseGenerator
  ) -> Self {
    self.on(route: route) { req, _ in try await closure(req) }
  }
}
