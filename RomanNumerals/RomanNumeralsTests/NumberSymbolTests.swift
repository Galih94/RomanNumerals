//
//  NumberSymbolTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 16/09/23.
//

import XCTest
import RomanNumerals

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
