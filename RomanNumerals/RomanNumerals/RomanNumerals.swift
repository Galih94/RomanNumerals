//
//  RomanNumerals.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 15/09/23.
//

import Foundation

public enum RomanNumerals {
    
    static let ZERO_INDEX = 0
    static let ONE_INDEX = 1
    
    static let ZERO_NUMBER = 0
    static let TENS_NUMBER = 10
    static let DEFAULT_NUMBER = 0
    
    static let ANY_ERROR_CODE = 0
    
    private static func calculate(from accumulation: Int, with number: Int, previousNumber: Int) -> Int {
        if isAccumulationZero(accumulation) {
            return number
        } else if previousNumber < number {
            return (accumulation - previousNumber) + (number - previousNumber)
        } else {
            return addAccumulationAndNewNumber(from: accumulation, with: number)
        }
    }
    
    private static func isFirstIndex(_ index: Int) -> Bool {
        return index == ZERO_INDEX
    }
    
    private static func previousIndex(_ index: Int) -> Int? {
        return isFirstIndex(index) ? nil : index - ONE_INDEX
    }
    
    private static func isAccumulationZero(_ accumulation: Int) -> Bool {
        return accumulation == ZERO_NUMBER
    }
    
    private static func addAccumulationAndNewNumber(from accumulation: Int, with number: Int) -> Int {
        return accumulation + number
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
            let previousNumber = getPreviousIndexNumber(index: previousIndex(i), from: array)
            guard let symbolValue = Symbol(rawValue: array[i]) else {
                throw NSError(domain: "Found error on converting Roman text ", code: ANY_ERROR_CODE)
            }
            result = calculate(from: result, with: symbolValue.convertNominalTextGreekToNumber(), previousNumber: previousNumber)
        }
        return result
    }
}
