//
//  Operation.swift
//  CalculatorApp1
//
//  Created by Hwangseokbeom on 11/21/24.
//
enum CalculatorButton {
    case allClear
    case equals
    case addition
    case subtraction
    case multiplication
    case division
    case number(Int) // 숫자는 Int로 처리

    static func from(title: String) -> CalculatorButton? {
        switch title {
        case "AC":
            return .allClear
        case "=":
            return .equals
        case "+":
            return .addition
        case "-":
            return .subtraction
        case "*":
            return .multiplication
        case "/":
            return .division
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
