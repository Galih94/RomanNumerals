//
//  NumberSymbol.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 18/09/23.
//

public enum NumberSymbol {
    public static func convert(_ number: Int) -> String {
        switch number {
        case 1:
            return "I"
        case 5:
            return "V"
        case 10:
            return "X"
        case 50:
            return "L"
        case 100:
            return "C"
        case 500:
            return "D"
        case 1000:
            return "M"
        default:
            return ""
        }
    }
}
