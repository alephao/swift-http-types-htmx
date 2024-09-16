import HTTPTypes
import HTTPTypesHtmx
import XCTest

final class ResponseHeadersTests: XCTestCase {
  func test_HTTPFieldNames() {
    XCTAssertEqual(HTTPField.Name.hxLocation.description, "HX-Location")
    XCTAssertEqual(HTTPField.Name.hxPushUrl.description, "HX-Push-Url")
    XCTAssertEqual(HTTPField.Name.hxRedirect.description, "HX-Redirect")
    XCTAssertEqual(HTTPField.Name.hxRefresh.description, "HX-Refresh")
    XCTAssertEqual(HTTPField.Name.hxReplaceUrl.description, "HX-Replace-Url")
    XCTAssertEqual(HTTPField.Name.hxReswap.description, "HX-Reswap")
    XCTAssertEqual(HTTPField.Name.hxRetarget.description, "HX-Retarget")
    XCTAssertEqual(HTTPField.Name.hxReselect.description, "HX-Reselect")
    XCTAssertEqual(HTTPField.Name.hxTriggerAfterSettle.description, "HX-Trigger-After-Settle")
    XCTAssertEqual(HTTPField.Name.hxTriggerAfterSwap.description, "HX-Trigger-After-Swap")
  }

  func test_HTTPField_Initializers() {
    XCTAssertEqual(HTTPField.hxLocation("/example").description, "HX-Location: /example")
    XCTAssertEqual(HTTPField.hxPushUrl(.false).description, "HX-Push-Url: false")
    XCTAssertEqual(HTTPField.hxPushUrl(.url("/example")).description, "HX-Push-Url: /example")
    XCTAssertEqual(HTTPField.hxRedirect("/example").description, "HX-Redirect: /example")
    XCTAssertEqual(HTTPField.hxRefresh().description, "HX-Refresh: true")
    XCTAssertEqual(HTTPField.hxReplaceUrl(.false).description, "HX-Replace-Url: false")
    XCTAssertEqual(
      HTTPField.hxReplaceUrl(.url("https://example.com")).description,
      "HX-Replace-Url: https://example.com"
    )
    XCTAssertEqual(HTTPField.hxReswap(.innerHTML).description, "HX-Reswap: innerHTML")
    XCTAssertEqual(HTTPField.hxReswap(.outerHTML).description, "HX-Reswap: outerHTML")
    XCTAssertEqual(HTTPField.hxReswap(.beforebegin).description, "HX-Reswap: beforebegin")
    XCTAssertEqual(HTTPField.hxReswap(.afterbegin).description, "HX-Reswap: afterbegin")
    XCTAssertEqual(HTTPField.hxReswap(.beforeend).description, "HX-Reswap: beforeend")
    XCTAssertEqual(HTTPField.hxReswap(.afterend).description, "HX-Reswap: afterend")
    XCTAssertEqual(HTTPField.hxReswap(.delete).description, "HX-Reswap: delete")
    XCTAssertEqual(HTTPField.hxReswap(.none).description, "HX-Reswap: none")
    XCTAssertEqual(
      HTTPField.hxReswap("raw this can be anything").description,
      "HX-Reswap: raw this can be anything"
    )
    XCTAssertEqual(HTTPField.hxRetarget("cssSelector").description, "HX-Retarget: cssSelector")
    XCTAssertEqual(HTTPField.hxReselect("cssSelector").description, "HX-Reselect: cssSelector")
    XCTAssertEqual(
      HTTPField.hxTriggerAfterSettle("any value").description,
      "HX-Trigger-After-Settle: any value"
    )
    XCTAssertEqual(
      HTTPField.hxTriggerAfterSwap("any value").description,
      "HX-Trigger-After-Swap: any value"
    )
  }

  func test_HTTPFieldsGetters_EmptyValues() {
    let headers = HTTPFields()
    XCTAssertNil(headers.hxLocation)
    XCTAssertNil(headers.hxPushUrl)
    XCTAssertNil(headers.hxRedirect)
    XCTAssertFalse(headers.hxRefresh)
    XCTAssertNil(headers.hxReplaceUrl)
    XCTAssertNil(headers.hxReswap)
    XCTAssertNil(headers.hxRetarget)
    XCTAssertNil(headers.hxReselect)
    XCTAssertNil(headers.hxTriggerAfterSettle)
    XCTAssertNil(headers.hxTriggerAfterSwap)
  }

  func test_HTTPFieldsGetters_NonEmptyValues() {
    let headers = HTTPFields([
      .hxLocation("/example"),
      .hxRedirect("/example"),
      .hxRefresh(),
      .hxRetarget("cssSelector"),
      .hxReselect("cssSelector"),
      .hxTriggerAfterSettle("any value"),
      .hxTriggerAfterSwap("any value"),
    ])
    XCTAssertEqual(headers.hxLocation, "/example")
    XCTAssertEqual(headers.hxRedirect, "/example")
    XCTAssertTrue(headers.hxRefresh)
    XCTAssertEqual(headers.hxRetarget, "cssSelector")
    XCTAssertEqual(headers.hxReselect, "cssSelector")
    XCTAssertEqual(headers.hxTriggerAfterSettle, "any value")
    XCTAssertEqual(headers.hxTriggerAfterSwap, "any value")
  }

  func test_HTTPFieldsGetters_NonEmptyValues_HxPushUrl() {
    let headersHxPushUrl: [(HTTPField, HxPushUrl)] = [
      (HTTPField.hxPushUrl(.false), .false),
      (HTTPField.hxPushUrl(.url("/example")), .url("/example")),
    ]
    for (header, value) in headersHxPushUrl {
      XCTAssertEqual(HTTPFields([header]).hxPushUrl, value)
    }
  }

  func test_HTTPFieldsGetters_NonEmptyValues_HxReplaceUrl() {
    let headersHxReplaceUrl: [(HTTPField, HxReplaceUrl)] = [
      (HTTPField.hxReplaceUrl(.false), .false),
      (HTTPField.hxReplaceUrl(.url("https://example.com")), .url("https://example.com")),
    ]
    for (header, value) in headersHxReplaceUrl {
      XCTAssertEqual(HTTPFields([header]).hxReplaceUrl, value)
    }
  }

  func test_HTTPFieldsGetters_NonEmptyValues_HxReswap() {
    let headersHxReswap: [(HTTPField, HxSwap)] = [
      (HTTPField.hxReswap(.innerHTML), .innerHTML),
      (HTTPField.hxReswap(.outerHTML), .outerHTML),
      (HTTPField.hxReswap(.beforebegin), .beforebegin),
      (HTTPField.hxReswap(.afterbegin), .afterbegin),
      (HTTPField.hxReswap(.beforeend), .beforeend),
      (HTTPField.hxReswap(.afterend), .afterend),
      (HTTPField.hxReswap(.delete), .delete),
      (HTTPField.hxReswap(.none), .none),
      (HTTPField.hxReswap("any value"), "any value"),
    ]
    for (header, value) in headersHxReswap {
      XCTAssertEqual(HTTPFields([header]).hxReswap, value)
    }
  }
}
