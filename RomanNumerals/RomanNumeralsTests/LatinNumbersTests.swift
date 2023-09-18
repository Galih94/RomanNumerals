//
//  LatinNumbersTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 18/09/23.
//

import XCTest
import RomanNumerals

public enum LatinNumbers {
    private static func calculate(from number: Int) -> String {
        if number == 0 {
            return ""
        } else if number < 5 {
            if number == 5 - 1 {
                return "IV"
            } else {
                return "I\(LatinNumbers.calculate(from: number - 1))"
            }
        } else if number < 10 {
            if number == 10 - 1 {
                return "IX"
            } else {
                return "V\(LatinNumbers.calculate(from: number - 5))"
            }
        } else if number < 50 {
            if (40...50).contains(number) {
                return "XL\(LatinNumbers.calculate(from: number - 40))"
            } else {
                return "X\(LatinNumbers.calculate(from: number - 10))"
            }
        } else {
            return ""
        }
    }
    
    public static func convertRomanNumerals(from number: Int) -> String {
        guard NumberSymbol.convert(number) != "" else {
            return calculate(from: number)
        }
        return NumberSymbol.convert(number)
    }
}

final class LatinNumbersTests: XCTestCase {
    func test_convertNumber_singleSymbol() {
        expect(from: [1, 5, 10, 50, 100, 500, 1000, 0],
               expectedSymbols: ["I", "V", "X", "L", "C", "D", "M", ""])
    }
    
    func test_convertNumber_underFive() {
        expect(from: [1, 2, 3, 4],
               expectedSymbols: ["I", "II", "III", "IV"])
    }
    
    func test_convertNumber_underTen() {
        expect(from: [6, 7, 8, 9],
               expectedSymbols: ["VI", "VII", "VIII", "IX"])
    }
    
    func test_convertNumber_underFifty() {
        expect(from: [20, 22, 30, 35, 40, 49 ],
               expectedSymbols: ["XX", "XXII", "XXX", "XXXV", "XL", "XLIX"])
    }
    
    // MARK: Helper
    private func expect(from numbers: [Int], expectedSymbols: [String], file: StaticString = #filePath, line: UInt = #line ) {
        for i in 0..<numbers.count {
            XCTAssertEqual(LatinNumbers.convertRomanNumerals(from: numbers[i]), expectedSymbols[i], file: file, line: line)
        }
    }

}
