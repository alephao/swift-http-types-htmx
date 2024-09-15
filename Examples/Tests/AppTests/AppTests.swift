import Hummingbird
import HummingbirdTesting
import Logging
import XCTest
import SnapshotTesting
import InlineSnapshotTesting
import Dependencies

@testable import App

final class AppTests: XCTestCase {
  struct TestArguments: AppArguments {
    let hostname = "127.0.0.1"
    let port = 0
    let logLevel: Logger.Level? = .trace
  }

  func req(route: Route, headers: HTTPFields = [:], _ callback: @escaping (TestResponse) async throws -> Void) async throws {
    let args = TestArguments()
    let app = try await buildApplication(args)
    try await app.test(.router) { client in
      try await client.execute(route: route, headers: headers, testCallback: callback)
    }
  }

  func testHxLocation() async throws {
    try await req(route: .hxLocation) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        Content-Type: text/html
        Content-Length: 850

        <!DOCTYPE html>
        <html>
          <head>
            <title>swift-http-types-htmx-examples</title>
            <link
              rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
            >
            <script src="https://unpkg.com/htmx.org@2.0.2"></script>
          </head>
          <body>
            <header class="container">
              <nav>
                <ul>
                  <li><a href="/examples/hx-location">HX-Location</a></li>
                  <li><a href="/examples/hx-reswap">HX-Reswap</a></li>
                  <li><a href="/examples/hx-trigger">HX-Trigger</a></li>
                </ul>
              </nav>
            </header>
            <main class="container">
            <div>
          <h2>HX-Location Example</h2>
          <p>Pressing the button will do client-side redirection via the HX-Location header</p>
          <div>
            <button
              hx-post="/examples/hx-location"
            >Submit</button>
          </div>
        </div>
            </main>
          </body>
        </html>
        """
      }
    }
  }

  func testHxLocationSubmit() async throws {
    try await req(route: .hxLocationSubmit) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        400 Bad Request
        Content-Length: 0
        """
      }
    }

    try await req(
      route: .hxLocationSubmit,
      headers: HTTPFields([.hxRequest()])
    ) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        HX-Location: /examples/hx-location-b
        Content-Length: 0
        """
      }
    }
  }

  func testHxLocationB() async throws {
    try await req(route: .hxLocationB) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        Content-Type: text/html
        Content-Length: 853

        <!DOCTYPE html>
        <html>
          <head>
            <title>swift-http-types-htmx-examples</title>
            <link
              rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
            >
            <script src="https://unpkg.com/htmx.org@2.0.2"></script>
          </head>
          <body>
            <header class="container">
              <nav>
                <ul>
                  <li><a href="/examples/hx-location">HX-Location</a></li>
                  <li><a href="/examples/hx-reswap">HX-Reswap</a></li>
                  <li><a href="/examples/hx-trigger">HX-Trigger</a></li>
                </ul>
              </nav>
            </header>
            <main class="container">
            <div>
          <h2>Redirected!</h2>
          <p>You got redirected here via HX-Location header, click the button to be redirected back.</p>
          <div>
            <button
              hx-post="/examples/hx-location-b"
            >Submit</button>
          </div>
        </div>
            </main>
          </body>
        </html>
        """
      }
    }
  }

  func testHxLocationBSubmit() async throws {
    try await req(route: .hxLocationSubmit) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        400 Bad Request
        Content-Length: 0
        """
      }
    }

    try await req(
      route: .hxLocationBSubmit,
      headers: HTTPFields([.hxRequest()])
    ) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        HX-Location: /examples/hx-location
        Content-Length: 0
        """
      }
    }
  }

  func testHxReswap() async throws {
    try await withDependencies({
      $0.date = .constant(.init(timeIntervalSince1970: 1234567))
    }) {
      try await req(route: .hxReswapHttp) { response in
        assertInlineSnapshot(of: response, as: .http) {
          """
          200 OK
          Content-Type: text/html
          Content-Length: 997

          <!DOCTYPE html>
          <html>
            <head>
              <title>swift-http-types-htmx-examples</title>
              <link
                rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
              >
              <script src="https://unpkg.com/htmx.org@2.0.2"></script>
            </head>
            <body>
              <header class="container">
                <nav>
                  <ul>
                    <li><a href="/examples/hx-location">HX-Location</a></li>
                    <li><a href="/examples/hx-reswap">HX-Reswap</a></li>
                    <li><a href="/examples/hx-trigger">HX-Trigger</a></li>
                  </ul>
                </nav>
              </header>
              <main class="container">
              <div>
            <h2>HX-Reswap Example</h2>
            <p>This example uses HX-Reswap and HX-Retarget headers to update the input with the server's current timestamp</p>
            <div>
              <button
                hx-get="/examples/hx-reswap"
                hx-swap="none"
              >Swap via HX-Reswap and HX-Retarget</button>
              <br>
              <br>
              <input id="timestamp" value="1234567.0" readonly />
            </div>
          </div>
              </main>
            </body>
          </html>
          """
        }
      }

      try await req(
        route: .hxReswapHttp,
        headers: HTTPFields([.hxRequest()])
      ) { response in
        assertInlineSnapshot(of: response, as: .http) {
          """
          200 OK
          Content-Type: text/html
          HX-Retarget: #timestamp
          HX-Reswap: outerHTML
          Content-Length: 51

          <input id="timestamp" value="1234567.0" readonly />
          """
        }
      }
    }
  }

  func testHxTrigger() async throws {
    try await req(route: .hxTrigger) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        Content-Type: text/html
        Content-Length: 999

        <!DOCTYPE html>
        <html>
          <head>
            <title>swift-http-types-htmx-examples</title>
            <link
              rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"
            >
            <script src="https://unpkg.com/htmx.org@2.0.2"></script>
          </head>
          <body>
            <header class="container">
              <nav>
                <ul>
                  <li><a href="/examples/hx-location">HX-Location</a></li>
                  <li><a href="/examples/hx-reswap">HX-Reswap</a></li>
                  <li><a href="/examples/hx-trigger">HX-Trigger</a></li>
                </ul>
              </nav>
            </header>
            <main class="container">
            <div>
          <h2>HX-Trigger Example</h2>
          <p>This example uses HX-Trigger to trigger a client-side event that shows an alert</p>
          <div>
            <button
              hx-post="/examples/hx-trigger"
              hx-swap="none"
            >Trigger</button>
          </div>
          <script>
            document.body.addEventListener("showMessage", function(evt){
                alert(evt.detail.value);
            })
          </script>
        </div>
            </main>
          </body>
        </html>
        """
      }
    }
  }

  func testHxTriggerAlert() async throws {
    try await req(route: .hxTriggerAlert) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        400 Bad Request
        Content-Length: 0
        """
      }
    }

    try await req(
      route: .hxTriggerAlert,
      headers: HTTPFields([.hxRequest()])
    ) { response in
      assertInlineSnapshot(of: response, as: .http) {
        """
        200 OK
        HX-Trigger: {"showMessage":"This alert was triggered by HX-Trigger"}
        Content-Length: 0
        """
      }
    }
  }
}
