import Hummingbird
import Logging

/// Application arguments protocol. We use a protocol so we can call
/// `buildApplication` inside Tests as well as in the App executable.
/// Any variables added here also have to be added to `App` in App.swift and
/// `TestArguments` in AppTest.swift
public protocol AppArguments {
  var hostname: String { get }
  var port: Int { get }
  var logLevel: Logger.Level? { get }
}

// Request context used by application
typealias AppRequestContext = BasicRequestContext

///  Build application
/// - Parameter arguments: application arguments
public func buildApplication(_ arguments: some AppArguments) async throws
  -> some ApplicationProtocol
{
  let environment = Environment()
  let logger = {
    var logger = Logger(label: "swift-htmx-examples")
    logger.logLevel =
      arguments.logLevel ?? environment.get("LOG_LEVEL").map { Logger.Level(rawValue: $0) ?? .info }
      ?? .info
    return logger
  }()
  let router = buildRouter()
  let app = Application(
    router: router,
    configuration: .init(
      address: .hostname(arguments.hostname, port: arguments.port),
      serverName: "swift-htmx-examples"
    ),
    logger: logger
  )
  return app
}

/// Build router
func buildRouter() -> Router<AppRequestContext> {
  let router = Router(context: AppRequestContext.self)
  // Add middleware
  router.addMiddleware {
    // logging middleware
    LogRequestsMiddleware(.info)
  }

  router.get("/") { _, _ -> Response in
    return .html(htmlLayout("<p>Select an example</p>"))
  }
  registerSwapRoutes(router: router)
  return router
}
