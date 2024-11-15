//
//  CalulatorView.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit
import SnapKit

class CalulatorView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    let buttonStack: UIStackView
    
    

}
