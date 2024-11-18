//
//  UIStack.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/17/24.
//

import UIKit
import SnapKit


extension UIStackView {
    static func create(with axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        
        switch axis{
        case .vertical:
            stackView.axis = .vertical
            stackView.backgroundColor = .black
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.snp.makeConstraints { make in
                make.width.equalTo(350)
            }
        case .horizontal:
            stackView.axis = .horizontal
            stackView.backgroundColor = .black
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            stackView.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
        @unknown default:
            fatalError("Unknown type")
        }
        return stackView
    }
}
