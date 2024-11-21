//
//  UIButton.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit
import SnapKit


extension UIButton {
    static func create(withTitle title: String) -> UIButton {
        let button = UIButton()
        let calculatorButton = CalculatorButton.from(title: title)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.frame.size.width = 80
        button.frame.size.height = 80
        button.layer.cornerRadius = 40
        switch calculatorButton {
        case .allClear, .equals, .addition, .subtraction, .multiplication, .division:
            button.backgroundColor = .orange
        default:
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        }
        return button
    }
}
