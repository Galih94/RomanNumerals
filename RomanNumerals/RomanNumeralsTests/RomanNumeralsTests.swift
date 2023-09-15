//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 15/09/23.
//

import XCTest
import RomanNumerals

final class RomanNumeralsTests: XCTestCase {
    func test_convertTextGreekToNumber() {
        do {
            try expect(from: ["I", "II", "IV", "IX", "X", "XI", "XXX", "LI", "LIV", "CIX", "CX", "DIX", "MCMXCIV"],
                       expectAnswers: [1, 2, 4, 9, 10, 11, 30, 51, 54, 109, 110, 509, 1994])
            try expectErrors(from: ["A", "GALIH", "G", "1"])
        } catch {
            XCTFail("Failed to run tests")
        }
    }
    
    // MARK: Helper
    
    private func expect(from texts: [String], expectAnswers: [Int], file: StaticString = #filePath, line: UInt = #line ) throws {
        try texts.enumerated().forEach { index, text in
            XCTAssertEqual(try RomanNumerals.convertRomanTextToNumber(text), expectAnswers[index], file: file, line: line)
        }
    }
    
    private func expectErrors(from texts: [String], file: StaticString = #filePath, line: UInt = #line ) throws {
        try texts.forEach { text in
            XCTAssertThrowsError(try RomanNumerals.convertRomanTextToNumber(text), file: file, line: line)
        }
    }
}
