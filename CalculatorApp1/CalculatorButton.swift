//
//  Untitled.swift
//  CalculatorApp1
//
//  Created by Hwangseokbeom on 11/22/24.
//

enum CalculatorButton {
    case allClear
    case equals
    case addition
    case subtraction
    case multiplication
    case division
    case number(Int)

    static func from(title: String) -> CalculatorButton? {
        switch title {
        case "AC": return .allClear
        case "=": return .equals
        case "+": return .addition
        case "-": return .subtraction
        case "*": return .multiplication
        case "/": return .division
        default:
            if let number = Int(title) {
                return .number(number)
            }
            return nil
        }
    }

    func getOperation() -> (Int, Int) -> Int {
        switch self {
        case .addition: return (+)
        case .subtraction: return (-)
        case .multiplication: return (*)
        case .division: return (/)
        default:
            fatalError("Invalid operation")
        }
    }
}
