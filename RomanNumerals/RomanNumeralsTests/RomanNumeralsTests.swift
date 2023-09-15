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
        expect(from: [.I, .V, .X, .L, .C, .D, .M], expectAnswers: ["I", "V", "X", "L", "C", "D", "M"])
    }
    
    // MARK: Helper
    private func expect(from symbols: [Symbol], expectAnswers: [String], file: StaticString = #filePath, line: UInt = #line ) {
        symbols.enumerated().forEach { index, symbol in
            XCTAssertEqual(symbol.rawValue, expectAnswers[index], file: file, line: line)
        }
    }
}
