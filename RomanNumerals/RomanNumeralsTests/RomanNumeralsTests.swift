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
    
    public static func convertTextGreekToNumber(_ text: String) -> Int {
        return 1
    }
}

final class RomanNumeralsTests: XCTestCase {
    func test_convertTextGreekToNumber() {
        XCTAssertEqual(RomanNumerals.convertTextGreekToNumber("I"), 1)
    }
}
