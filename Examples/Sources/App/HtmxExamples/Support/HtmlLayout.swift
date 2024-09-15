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
        <nav>
          <ul>
            <li><a href="\(Route.hxLocation.path)">HX-Location</a></li>
            <li><a href="\(Route.hxReswapHttp.path)">HX-Reswap</a></li>
          </ul>
        </nav>
      </header>
      <main class="container">
      \(content)
      </main>
    </body>
  </html>
  """
}
