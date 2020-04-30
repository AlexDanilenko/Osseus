import XCTest
@testable import Osseus

final class OsseusTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Osseus().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
