//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 15/09/23.
//

import XCTest
import RomanNumerals


public final class RomanNumerals {
    
    static let TENS_NUMBER = 10
    
    private init () {}
    
    private static func calculate(from accumulation: Int, with number: Int, previousNumber: Int) -> Int {
        if number <= TENS_NUMBER && isAccumulationZero(accumulation) {
            if accumulation < number {
                return number - accumulation
            } else {
                return addAccumulationAndNewNumber(from: accumulation, with: number)
            }
        } else {
            if isAccumulationZero(accumulation) {
                return number
            } else if previousNumber < number {
                return (accumulation - previousNumber) + (number - previousNumber)
            } else {
                return addAccumulationAndNewNumber(from: accumulation, with: number)
            }
        }
    }
    
    private static func previousIndex(_ index: Int) -> Int? {
        return index == 0 ? nil : index - 1
    }
    
    private static func isAccumulationZero(_ accumulation: Int) -> Bool {
        return accumulation == 0
    }
    
    private static func addAccumulationAndNewNumber(from accumulation: Int, with number: Int) -> Int {
        return accumulation + number
    }
    
    private static func getPreviousIndexNumber(index: Int?, from array: [String]) -> Int {
        guard let previousIndex = index,
                let previousSymbolValue = Symbol(rawValue: array[previousIndex]) else {
            return 0
        }
        return previousSymbolValue.convertNominalTextGreekToNumber()
    }
    
    public static func convertRomanTextToNumber(_ text: String) throws -> Int {
        let array = text.map { String(describing: $0) }
        var result = 0
        for i in 0..<array.count {
            let previousNumber = getPreviousIndexNumber(index: previousIndex(i), from: array)
            guard let symbolValue = Symbol(rawValue: array[i]) else {
                throw NSError(domain: "Found error on converting Roman text ", code: 0)
            }
            result = calculate(from: result, with: symbolValue.convertNominalTextGreekToNumber(), previousNumber: previousNumber)
        }
        return result
    }
}

final class RomanNumeralsTests: XCTestCase {
    func test_convertTextGreekToNumber() {
        expect(from: ["I", "II", "IV", "IX", "X", "XI", "XXX", "LI", "LIV", "CIX", "CX", "MCMXCIV"],
               expectAnswers: [1, 2, 4, 9, 10, 11, 30, 51, 54, 109, 110, 1994])
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
