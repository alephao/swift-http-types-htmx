import Hummingbird
import HummingbirdTesting
import XCTest

@testable import App

extension TestClientProtocol {
  @discardableResult public func execute<Return>(
      route: Route,
      headers: HTTPFields = [:],
      body: ByteBuffer? = nil,
      testCallback: @escaping (TestResponse) async throws -> Return = { $0 }
  ) async throws -> Return {
     return try await execute(
      uri: route.path,
      method: route.httpMethod,
      headers: headers,
      body: body,
      testCallback: testCallback
     )
  }
}
