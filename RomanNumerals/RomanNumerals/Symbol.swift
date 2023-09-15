//
//  Symbol.swift
//  RomanNumerals
//
//  Created by Galih Samudra on 15/09/23.
//

public enum Symbol: String {
    case I
    case V
    case X
    case L
    case C
    case D
    case M
    
    public func convertNominalTextGreekToNumber() -> Int {
        switch self {
        case .I:
            return 1
        case .V:
            return 5
        case .X:
            return 10
        case .L:
            return 50
        case .C:
            return 100
        case .D:
            return 500
        case .M:
            return 1000
        }
    }
}
