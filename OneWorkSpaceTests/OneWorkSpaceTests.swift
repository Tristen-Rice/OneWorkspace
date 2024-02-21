import XCTest
@testable import OneWorkSpace

final class OneWorkSpaceTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let result = 2 + 2
        XCTAssertEqual(result, 4, "Expected 2 + 2 to equal 4")
    }

    func testPerformanceExample() throws {
        self.measure {
            let array = [1, 2, 3, 4, 5]
            let sum = array.reduce(0, +)
            XCTAssertEqual(sum, 15, "Expected the sum of [1, 2, 3, 4, 5] to be 15")
        }
    }

}
