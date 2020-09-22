import XCTest
@testable import RangeEnhancements

final class RangeEnhancementsTests: XCTestCase {
    // Make sure that we didn't accidentally cause an infinite loop anywhere,
    // if this test doesn't terminate, we have a problem.
    func testOverriding() {
        let _ = (0...5).upperBound
        let _ = (0..<5).upperBound
        let _ = (0...5).lowerBound
        let _ = (0..<5).lowerBound
        let _ = (0..<5).upperBoundDescription
        let _: BoundDescription<Int> = (0..<5).upperBoundDescription
        let _ = (0..<5).lowerBoundDescription
        let _: BoundDescription<Int> = (0..<5).lowerBoundDescription
        let partial: PartialRangeFrom = (0...)
        let _: Optional<Int> = partial.upperBound
        let _ = partial.lowerBound
        let _ = partial.upperBoundDescription
        let _ = partial.lowerBoundDescription
    }

    func testConstrain() {
        // closed ranges
        XCTAssertEqual(5.constrain(to: 0...10), 5)
        XCTAssertEqual((-1).constrain(to: 0...10), 0)
        XCTAssertEqual(10.constrain(to: 0...10), 10)
        XCTAssertEqual(11.constrain(to: 0...10), 10)
        // infinite ranges
        XCTAssertEqual(5.constrain(to: 0...), 5)
        XCTAssertEqual(0.constrain(to: 0...), 0)
        XCTAssertEqual((-1000).constrain(to: 0...), 0)
        XCTAssertEqual((-1000).constrain(to: ...10), -1000)
        XCTAssertEqual(100.constrain(to: ...10), 10)
        XCTAssertEqual(10.constrain(to: ...10), 10)
    }

    func testWrap() {
        XCTAssertEqual(10.wrap(in: 0..<10), 0)
        XCTAssertEqual(10.wrap(in: 0...10), 10)
        XCTAssertEqual(0.wrap(in: 0..<10), 0)
        XCTAssertEqual((-1).wrap(in: 0..<10), 9)
        XCTAssertEqual((-5).wrap(in: 0...10), 5)
        XCTAssertEqual(11.wrap(in: 0...10), 1)

        // extra long wrapping
        XCTAssertEqual(20.wrap(in: 0..<10), 0)
        XCTAssertEqual(23.wrap(in: 0..<10), 3)
        XCTAssertEqual(23.wrap(in: 0...10), 3)
        XCTAssertEqual((-10).wrap(in: 0...10), 0)
        XCTAssertEqual((-117).wrap(in: 0...10), 3)
        XCTAssertEqual(1000.wrap(in: 0...10), 10)
        XCTAssertEqual(1000.wrap(in: 0..<10), 0)

        XCTAssertEqual((-3).wrap(in: 0..<8), 5)
    }

    static var allTests = [
        ("testOverriding", testOverriding),
        ("testConstrain", testConstrain),
        ("testWrap", testWrap)
    ]
}
