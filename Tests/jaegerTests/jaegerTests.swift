import XCTest
@testable import jaeger

class jaegerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(jaeger().text, "Hello, World!")
    }


    static var allTests : [(String, (jaegerTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
