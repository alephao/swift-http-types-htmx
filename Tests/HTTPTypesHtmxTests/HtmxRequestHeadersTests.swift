import HTTPTypes
import HTTPTypesHtmx
import XCTest

final class RequestHeadersTests: XCTestCase {

  func test_HTTPFieldNames() {
    XCTAssertEqual(HTTPField.Name.hxBoosted.description, "HX-Boosted")
    XCTAssertEqual(HTTPField.Name.hxCurrentURL.description, "HX-Current-URL")
    XCTAssertEqual(HTTPField.Name.hxHistoryRestoreRequest.description, "HX-History-Restore-Request")
    XCTAssertEqual(HTTPField.Name.hxPrompt.description, "HX-Prompt")
    XCTAssertEqual(HTTPField.Name.hxRequest.description, "HX-Request")
    XCTAssertEqual(HTTPField.Name.hxTarget.description, "HX-Target")
    XCTAssertEqual(HTTPField.Name.hxTriggerName.description, "HX-Trigger-Name")
  }

  func test_HTTPField_Initializers() {
    XCTAssertEqual(HTTPField.hxBoosted().description, "HX-Boosted: true")
    XCTAssertEqual(
      HTTPField.hxCurrentURL("https://example.com").description,
      "HX-Current-URL: https://example.com"
    )
    XCTAssertEqual(
      HTTPField.hxHistoryRestoreRequest().description,
      "HX-History-Restore-Request: true"
    )
    XCTAssertEqual(HTTPField.hxPrompt("yes").description, "HX-Prompt: yes")
    XCTAssertEqual(HTTPField.hxRequest().description, "HX-Request: true")
    XCTAssertEqual(HTTPField.hxTarget("myDiv").description, "HX-Target: myDiv")
    XCTAssertEqual(
      HTTPField.hxTriggerName("myTriggerName").description,
      "HX-Trigger-Name: myTriggerName"
    )
  }

  func test_HTTPFieldsGetters_EmptyValues() {
    let headers = HTTPFields()
    XCTAssertFalse(headers.hxBoosted)
    XCTAssertNil(headers.hxCurrentURL)
    XCTAssertFalse(headers.hxHistoryRestoreRequest)
    XCTAssertNil(headers.hxPrompt)
    XCTAssertFalse(headers.hxRequest)
    XCTAssertNil(headers.hxTarget)
    XCTAssertNil(headers.hxTriggerName)
  }

  func test_HTTPFieldsGetters_NonEmptyValues() {
    let headers = HTTPFields([
      .hxBoosted(),
      .hxCurrentURL("https://example.com"),
      .hxHistoryRestoreRequest(),
      .hxPrompt("yes"),
      .hxRequest(),
      .hxTarget("myDiv"),
      .hxTriggerName("myTriggerName"),
    ])
    XCTAssertTrue(headers.hxBoosted)
    XCTAssertEqual(headers.hxCurrentURL, "https://example.com")
    XCTAssertTrue(headers.hxHistoryRestoreRequest)
    XCTAssertEqual(headers.hxPrompt, "yes")
    XCTAssertTrue(headers.hxRequest)
    XCTAssertEqual(headers.hxTarget, "myDiv")
    XCTAssertEqual(headers.hxTriggerName, "myTriggerName")
  }
}
