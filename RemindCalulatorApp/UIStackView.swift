//
//  UIStack.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/17/24.
//

import UIKit
import SnapKit

extension UIStack {
    static func create(withTitle title: String) -> UIButton {
        let button = UIButton()
        switch title {
        case "+", "-", "*", "/", "AC", "=":
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = .orange
            button.frame.size.width = 80
            button.frame.size.height = 80
            button.layer.cornerRadius = 40
        default:
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.frame.size.width = 80
            button.frame.size.height = 80
            button.layer.cornerRadius = 40
        }
        return button
    }
}
