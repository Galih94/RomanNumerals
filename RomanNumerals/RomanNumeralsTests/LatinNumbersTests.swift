//
//  LatinNumbersTests.swift
//  RomanNumeralsTests
//
//  Created by Galih Samudra on 18/09/23.
//

import XCTest

public enum LatinNumbers {
    public static func convertRomanNumerals(from number: Int) -> String {
        return "I"
    }
}

final class LatinNumbersTests: XCTestCase {
    func test_convertNumber() {
        XCTAssertEqual(LatinNumbers.convertRomanNumerals(from: 1), "I")
    }
}
