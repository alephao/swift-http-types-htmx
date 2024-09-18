import Hummingbird
import HummingbirdTesting
import SnapshotTesting

extension Snapshotting where Value == TestResponse, Format == String {
  public static let http: Snapshotting = Snapshotting<TestResponse, String>
    .init(pathExtension: "curl.txt", diffing: .lines) { testResponse in
      let contentLength = testResponse.headers[.contentLength].flatMap({ Int($0) }) ?? 0

      var components: [String?] = [testResponse.status.description]
      components += testResponse.headers.map({ f in f.description })
      if contentLength > 0 {
        var body = testResponse.body
        if let bodyString = body.readString(length: testResponse.body.readableBytes, encoding: .utf8), bodyString.count > 0 {
          components.append("")
          components.append(bodyString)
        }
      }
      return components.compactMap({ $0 }).joined(separator: "\n")
    }
}
