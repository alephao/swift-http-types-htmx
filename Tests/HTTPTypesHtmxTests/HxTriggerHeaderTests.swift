import HTTPTypes
import HTTPTypesHtmx
import XCTest

final class HxTriggerHeadersTests: XCTestCase {
  func test_HTTPFieldNames() {
    XCTAssertEqual(HTTPField.Name.hxTrigger.description, "HX-Trigger")
  }

  func test_HTTPField_Initializers() {
    XCTAssertEqual(HTTPField.hxTrigger(id: "myId").description, "HX-Trigger: myId")
    XCTAssertEqual(HTTPField.hxTrigger(event: "myEvent").description, "HX-Trigger: myEvent")
  }

  func test_HTTPFieldsGetters_EmptyValues() {
    let headers = HTTPFields()
    XCTAssertNil(headers.hxTrigger)
  }

  func test_HTTPFieldsGetters_NonEmptyValues() {
    XCTAssertEqual(HTTPFields([.hxTrigger(id: "myId")]).hxTrigger, "myId")
    XCTAssertEqual(HTTPFields([.hxTrigger(event: "myEvent")]).hxTrigger, "myEvent")
  }
}
