//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 15/09/23.
//

import XCTest
import RomanNumerals

public final class RomanNumerals {
    private init () {}
    
    private static func calculate(from accumulation: Int, with number: Int) -> Int {
        if accumulation < number {
            return number - accumulation
        } else {
            return accumulation + number
        }
    }
    
    public static func convertRomanTextToNumber(_ text: String) throws -> Int {
        let array = text.map { String(describing: $0) }
        var result = 0
        for i in 0..<array.count {
            guard let symbolValue = Symbol(rawValue: array[i]) else {
                throw NSError(domain: "Found error on converting Roman text ", code: 0)
            }
            result = calculate(from: result, with: symbolValue.convertNominalTextGreekToNumber())
        }
        return result
    }
}

final class RomanNumeralsTests: XCTestCase {
    func test_convertTextGreekToNumber() {
        expect(from: ["I", "II", "IV", "IX", "X", "XI", "XXX", "CX", "LVIII"],
               expectAnswers: [1, 2, 4, 9, 10, 11, 30, 110, 58])
        expectErrors(from: ["A", "GALIH", "G", "1"])
    }
    
    // MARK: Helper
    
    private func expect(from texts: [String], expectAnswers: [Int], file: StaticString = #filePath, line: UInt = #line ) {
        texts.enumerated().forEach { index, text in
            XCTAssertEqual(try? RomanNumerals.convertRomanTextToNumber(text), expectAnswers[index], file: file, line: line)
        }
    }
    
    private func expectErrors(from texts: [String], file: StaticString = #filePath, line: UInt = #line ) {
        texts.forEach { text in
            XCTAssertNoThrow(try? RomanNumerals.convertRomanTextToNumber(text), file: file, line: line)
        }
    }
}
