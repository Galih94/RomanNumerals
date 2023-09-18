//
//  LatinNumbersTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 18/09/23.
//

import XCTest
import RomanNumerals

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
