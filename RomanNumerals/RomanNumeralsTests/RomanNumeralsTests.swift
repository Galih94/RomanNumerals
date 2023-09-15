//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 15/09/23.
//

import XCTest

public enum Symbol: String {
    case I
    case V
    case X
    case L
    case C
    case D
    case M
}

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
