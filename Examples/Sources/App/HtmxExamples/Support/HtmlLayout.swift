func htmlLayout(_ content: String) -> String {
  """
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
        <nav style="display: flex;align-items: center;height: 64px;gap: 16px;">
          <a href="\(Route.swapHttp.path)">swap via http headers</a>
        </nav>
      </header>
      <main class="container">
      \(content)
      </main>
    </body>
  </html>
  """
}
