//
//  LatinNumbersTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 18/09/23.
//

import XCTest
import RomanNumerals

public enum LatinNumbers {
    public static func convertRomanNumerals(from number: Int) -> String {
        return NumberSymbol.convert(number)
    }
}

final class LatinNumbersTests: XCTestCase {
    func test_convertNumber() {
        XCTAssertEqual(LatinNumbers.convertRomanNumerals(from: 1), "I")
    }
}
