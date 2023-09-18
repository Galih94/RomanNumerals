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
        expect(from: [1, 5, 10, 50, 100, 500, 1000, 0],
               expectedSymbols: ["I", "V", "X", "L", "C", "D", "M", ""])
    }
    
    // MARK: Helper
    private func expect(from numbers: [Int], expectedSymbols: [String], file: StaticString = #filePath, line: UInt = #line ) {
        for i in 0..<numbers.count {
            XCTAssertEqual(NumberSymbol.convert(numbers[i]), expectedSymbols[i], file: file, line: line)
        }
    }

}
