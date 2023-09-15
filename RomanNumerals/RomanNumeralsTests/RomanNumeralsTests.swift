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
    
    func test_convertNominalTextGreekToNumber() {
        expect(from: [.I, .V, .X, .L, .C, .D, .M], expectAnswers: [1, 5, 10, 50, 100, 500, 1000])
    }
    
    // MARK: Helper
    private func expect(from symbols: [Symbol], expectAnswers: [String], file: StaticString = #filePath, line: UInt = #line ) {
        symbols.enumerated().forEach { index, symbol in
            XCTAssertEqual(symbol.rawValue, expectAnswers[index], file: file, line: line)
        }
    }
    
    private func expect(from symbols: [Symbol], expectAnswers: [Int], file: StaticString = #filePath, line: UInt = #line ) {
        symbols.enumerated().forEach { index, symbol in
            XCTAssertEqual(symbol.convertNominalTextGreekToNumber(), expectAnswers[index], file: file, line: line)
        }
    }
}
