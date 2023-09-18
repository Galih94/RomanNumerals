//
//  LatinNumbers.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 18/09/23.
//

public enum LatinNumbers {
    private static let RANGE_ONE_TO_FOUR = 1...4
    private static let RANGE_FIVE_TO_NINE = 5...9
    private static let RANGE_TEN_TO_FOURTY_NINE = 10...49
    private static let RANGE_FIFTY_TO_NINETY_NINE = 50...99
    private static let RANGE_A_HUNDRED_TO_FOUR_HUNDRED_NINETY_NINE = 100...499
    private static let RANGE_FIVE_HUNDRED_TO_NINE_HUNDRED_NINETY_NINE = 500...999
    private static let RANGE_A_THOUSAND_TO_FOUR_THOUSAND_NINE_HUNDRED_NINETY_NINE = 1000...4999
    
    public static func convertRomanNumerals(from number: Int) -> String {
        if number == 0 {
            return ""
        } else if RANGE_ONE_TO_FOUR.contains(number) {
            if number == 5 - 1 {
                return "IV"
            } else {
                return "I\(LatinNumbers.convertRomanNumerals(from: number - 1))"
            }
        } else if RANGE_FIVE_TO_NINE.contains(number) {
            if number == 10 - 1 {
                return "IX"
            } else {
                return "V\(LatinNumbers.convertRomanNumerals(from: number - 5))"
            }
        } else if RANGE_TEN_TO_FOURTY_NINE.contains(number) {
            if (40...49).contains(number) {
                return "XL\(LatinNumbers.convertRomanNumerals(from: number - 40))"
            } else {
                return "X\(LatinNumbers.convertRomanNumerals(from: number - 10))"
            }
        } else if RANGE_FIFTY_TO_NINETY_NINE.contains(number) {
            if (90...99).contains(number) {
                return "XC\(LatinNumbers.convertRomanNumerals(from: number - 90))"
            } else {
                return "L\(LatinNumbers.convertRomanNumerals(from: number - 50))"
            }
        } else if RANGE_A_HUNDRED_TO_FOUR_HUNDRED_NINETY_NINE.contains(number) {
            if (400...499).contains(number) {
                return "CD\(LatinNumbers.convertRomanNumerals(from: number - 400))"
            } else {
                return "C\(LatinNumbers.convertRomanNumerals(from: number - 100))"
            }
        } else if RANGE_FIVE_HUNDRED_TO_NINE_HUNDRED_NINETY_NINE.contains(number) {
            if (900...999).contains(number) {
                return "CM\(LatinNumbers.convertRomanNumerals(from: number - 900))"
            } else {
                return "D\(LatinNumbers.convertRomanNumerals(from: number - 500))"
            }
        } else if RANGE_A_THOUSAND_TO_FOUR_THOUSAND_NINE_HUNDRED_NINETY_NINE.contains(number) {
            return "M\(LatinNumbers.convertRomanNumerals(from: number - 1000))"
        } else {
            return ""
        }
    }
}
