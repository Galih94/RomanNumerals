//
//  NumberSymbolTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 16/09/23.
//

import XCTest

public enum NumberSymbol {
    public static func convert(_ number: Int) -> String {
        switch number {
        case 1:
            return "I"
        case 5:
            return "V"
        case 10:
            return "X"
        case 50:
            return "L"
        case 100:
            return "C"
        case 500:
            return "D"
        case 1000:
            return "M"
        default:
            return ""
        }
    }
}

final class NumberSymbolTests: XCTestCase {
    func test_translateNumberSymbols() {
        XCTAssertEqual(NumberSymbol.convert(1), "I")
        XCTAssertEqual(NumberSymbol.convert(5), "V")
        XCTAssertEqual(NumberSymbol.convert(10), "X")
        XCTAssertEqual(NumberSymbol.convert(50), "L")
        XCTAssertEqual(NumberSymbol.convert(100), "C")
        XCTAssertEqual(NumberSymbol.convert(500), "D")
        XCTAssertEqual(NumberSymbol.convert(1000), "M")
        XCTAssertEqual(NumberSymbol.convert(0), "")
    }

}
