//
//  CalulatorView.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit
import SnapKit

class CalulatorView: UIView {

    let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "12345"
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    let buttonStack: UIStackView
        
    override init(frame: CGRect) {
        buttonStack = CalulatorView.createButtonStack()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .black
        addSubview(displayLabel)
        addSubview(buttonStack)
        
        displayLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
    }
    
    private static func createButtonStack() -> UIStackView {
        
        let buttonTitles = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "*"],
            ["AC", "0", "=", "/"]
        ]
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.snp.makeConstraints { make in
            make.width.equalTo(350)
        }
        
        for row in buttonTitles {
            let rowStack = UIStackView()
            rowStack.backgroundColor = .white
            rowStack.distribution = .fillEqually
            rowStack.axis = .horizontal
            rowStack.spacing = 10
            
            rowStack.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
            
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                rowStack.addArrangedSubview(button)
            }
            
            stackView.addArrangedSubview(rowStack)
        }
        
        
        return stackView
    }

}
