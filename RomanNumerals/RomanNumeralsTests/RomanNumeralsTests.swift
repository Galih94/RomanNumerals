//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 15/09/23.
//

import XCTest
import RomanNumerals

final class RomanNumeralsTests: XCTestCase {

    func test_translateSymbols() {
        XCTAssertEqual(Symbol.I.rawValue, "I")
        XCTAssertEqual(Symbol.V.rawValue, "V")
        XCTAssertEqual(Symbol.X.rawValue, "X")
        XCTAssertEqual(Symbol.L.rawValue, "L")
        XCTAssertEqual(Symbol.C.rawValue, "C")
        XCTAssertEqual(Symbol.D.rawValue, "D")
        XCTAssertEqual(Symbol.M.rawValue, "M")
    }
}
