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
    
    public static func convertRomanTextToNumber(_ text: String) throws -> Int {
        let array = text.map { String(describing: $0) }
        var result = 0
        for i in 0..<array.count {
            guard let symbolValue = Symbol(rawValue: array[i]) else {
                throw NSError(domain: "Found error on converting Roman text ", code: 0)
            }
            let currentTextValue = symbolValue.convertNominalTextGreekToNumber()
            result += currentTextValue
        }
        return result
    }
}

final class RomanNumeralsTests: XCTestCase {
    func test_convertTextGreekToNumber() {
        XCTAssertEqual(try? RomanNumerals.convertRomanTextToNumber("I"), 1)
        XCTAssertEqual(try? RomanNumerals.convertRomanTextToNumber("II"), 2)
        XCTAssertNoThrow(try? RomanNumerals.convertRomanTextToNumber("A"))
    }
}
