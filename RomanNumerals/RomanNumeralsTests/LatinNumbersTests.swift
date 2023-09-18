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
        } else if (1...4).contains(number) {
            if number == 5 - 1 {
                return "IV"
            } else {
                return "I\(LatinNumbers.calculate(from: number - 1))"
            }
        } else if (5...9).contains(number) {
            if number == 10 - 1 {
                return "IX"
            } else {
                return "V\(LatinNumbers.calculate(from: number - 5))"
            }
        } else if (10...49).contains(number) {
            if (40...49).contains(number) {
                return "XL\(LatinNumbers.calculate(from: number - 40))"
            } else {
                return "X\(LatinNumbers.calculate(from: number - 10))"
            }
        } else if (50...99).contains(number) {
            if (90...99).contains(number) {
                return "XC\(LatinNumbers.calculate(from: number - 90))"
            } else {
                return "L\(LatinNumbers.calculate(from: number - 50))"
            }
        } else if (100...499).contains(number) {
            if (400...499).contains(number) {
                return "CD\(LatinNumbers.calculate(from: number - 400))"
            } else {
                return "C\(LatinNumbers.calculate(from: number - 100))"
            }
        } else if (500...999).contains(number) {
            if (900...999).contains(number) {
                return "CM\(LatinNumbers.calculate(from: number - 900))"
            } else {
                return "D\(LatinNumbers.calculate(from: number - 500))"
            }
        } else if (1000...4999).contains(number) {
            return "M\(LatinNumbers.calculate(from: number - 1000))"
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
    func test_convertNumber_negativeNumber() {
        expect(from: [-1, -2, -3, -4],
               expectedSymbols: ["", "", "", ""])
    }
    
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
    
    func test_convertNumber_underHundred() {
        expect(from: [51, 59, 60, 75, 80, 90, 99 ],
               expectedSymbols: ["LI", "LIX", "LX", "LXXV", "LXXX", "XC", "XCIX"])
    }
    
    func test_convertNumber_underFiveHundred() {
        expect(from: [105, 110, 200, 250, 450, 499 ],
               expectedSymbols: ["CV", "CX", "CC", "CCL", "CDL", "CDXCIX"])
    }
    
    func test_convertNumber_underThousand() {
        expect(from: [505, 610, 800, 852, 950, 999 ],
               expectedSymbols: ["DV", "DCX", "DCCC", "DCCCLII", "CML", "CMXCIX"])
    }
    
    func test_convertNumber_overThousandBelowFiveThousand() {
        expect(from: [1005, 2000, 2023, 4900, 4999 ],
               expectedSymbols: ["MV", "MM", "MMXXIII", "MMMMCM", "MMMMCMXCIX"])
    }
    
    // MARK: Helper
    private func expect(from numbers: [Int], expectedSymbols: [String], file: StaticString = #filePath, line: UInt = #line ) {
        for i in 0..<numbers.count {
            XCTAssertEqual(LatinNumbers.convertRomanNumerals(from: numbers[i]), expectedSymbols[i], file: file, line: line)
        }
    }

}
