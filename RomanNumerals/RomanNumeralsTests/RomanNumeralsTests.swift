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
        XCTAssertEqual(Symbol.I.convertNominalTextGreekToNumber(), 1)
        XCTAssertEqual(Symbol.V.convertNominalTextGreekToNumber(), 5)
        XCTAssertEqual(Symbol.X.convertNominalTextGreekToNumber(), 10)
        XCTAssertEqual(Symbol.L.convertNominalTextGreekToNumber(), 50)
        XCTAssertEqual(Symbol.C.convertNominalTextGreekToNumber(), 100)
        XCTAssertEqual(Symbol.D.convertNominalTextGreekToNumber(), 500)
        XCTAssertEqual(Symbol.M.convertNominalTextGreekToNumber(), 1000)
    }
    
    // MARK: Helper
    private func expect(from symbols: [Symbol], expectAnswers: [String], file: StaticString = #filePath, line: UInt = #line ) {
        symbols.enumerated().forEach { index, symbol in
            XCTAssertEqual(symbol.rawValue, expectAnswers[index], file: file, line: line)
        }
    }
}
