//
//  LatinNumbers.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 18/09/23.
//

public enum LatinNumbers {
    public static func convertRomanNumerals(from number: Int) -> String {
        if number == 0 {
            return ""
        } else if (1...4).contains(number) {
            if number == 5 - 1 {
                return "IV"
            } else {
                return "I\(LatinNumbers.convertRomanNumerals(from: number - 1))"
            }
        } else if (5...9).contains(number) {
            if number == 10 - 1 {
                return "IX"
            } else {
                return "V\(LatinNumbers.convertRomanNumerals(from: number - 5))"
            }
        } else if (10...49).contains(number) {
            if (40...49).contains(number) {
                return "XL\(LatinNumbers.convertRomanNumerals(from: number - 40))"
            } else {
                return "X\(LatinNumbers.convertRomanNumerals(from: number - 10))"
            }
        } else if (50...99).contains(number) {
            if (90...99).contains(number) {
                return "XC\(LatinNumbers.convertRomanNumerals(from: number - 90))"
            } else {
                return "L\(LatinNumbers.convertRomanNumerals(from: number - 50))"
            }
        } else if (100...499).contains(number) {
            if (400...499).contains(number) {
                return "CD\(LatinNumbers.convertRomanNumerals(from: number - 400))"
            } else {
                return "C\(LatinNumbers.convertRomanNumerals(from: number - 100))"
            }
        } else if (500...999).contains(number) {
            if (900...999).contains(number) {
                return "CM\(LatinNumbers.convertRomanNumerals(from: number - 900))"
            } else {
                return "D\(LatinNumbers.convertRomanNumerals(from: number - 500))"
            }
        } else if (1000...4999).contains(number) {
            return "M\(LatinNumbers.convertRomanNumerals(from: number - 1000))"
        } else {
            return ""
        }
    }
}
