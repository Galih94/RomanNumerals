//
//  LatinNumbers.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 18/09/23.
//

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
