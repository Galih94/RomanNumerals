//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 15/09/23.
//

import Foundation

public enum RomanNumerals {
    
    private static let ZERO_INDEX = 0
    private static let ONE_INDEX = 1
    
    private static let ZERO_NUMBER = 0
    private static let DEFAULT_NUMBER = 0
    
    private static let ANY_ERROR_CODE = 0
    
    private static func calculate(from accumulation: Int, with number: Int, previousNumber: Int) -> Int {
        if accumulation == ZERO_NUMBER {
            return number
        } else if previousNumber < number {
            return (accumulation - previousNumber) + (number - previousNumber)
        } else {
            return accumulation + number
        }
    }
    
    private static func getPreviousIndex(_ index: Int) -> Int? {
        return index == ZERO_INDEX ? nil : index - ONE_INDEX
    }
    
    private static func getPreviousIndexNumber(index: Int?, from array: [String]) -> Int {
        guard let previousIndex = index,
                let previousSymbolValue = Symbol(rawValue: array[previousIndex]) else {
            return DEFAULT_NUMBER
        }
        return previousSymbolValue.convertNominalTextGreekToNumber()
    }
    
    public static func convertRomanTextToNumber(_ text: String) throws -> Int {
        let array = text.map { String(describing: $0) }
        var result = DEFAULT_NUMBER
        for i in ZERO_INDEX..<array.count {
            let previousNumber = getPreviousIndexNumber(index: getPreviousIndex(i), from: array)
            guard let symbolValue = Symbol(rawValue: array[i]) else {
                throw NSError(domain: "Found error on converting Roman text ", code: ANY_ERROR_CODE)
            }
            result = calculate(from: result, with: symbolValue.convertNominalTextGreekToNumber(), previousNumber: previousNumber)
        }
        return result
    }
}
