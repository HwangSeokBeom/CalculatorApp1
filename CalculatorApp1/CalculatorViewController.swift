//
//  ViewController.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/15/24.
//

import UIKit


class CalculatorViewController: UIViewController {
    private let calculatorView = CalculatorView()
    private let calculatorViewModel = CalculatorViewModel()
    
    override func loadView() {
        self.view = calculatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
    }
    
    private func setupButtonActions() {
        calculatorView.buttonStack.arrangedSubviews
            .compactMap { $0 as? UIStackView }
            .flatMap { $0.arrangedSubviews }
            .compactMap { $0 as? UIButton }
            .forEach { button in
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
                button.addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchCancel, .touchDragExit])
            }
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        sender.setTitle(title, for: .normal)
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let button = CalculatorButton.from(title: title) else { return }
        
        sender.setTitle(title, for: .highlighted)
        UIView.animate(withDuration: 0.1) { [self] in
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            switch button {
            case .allClear:
                calculatorViewModel.reset()
            case .equals:
                calculatorViewModel.calculateResult()
            case .addition, .subtraction, .multiplication, .division:
                // 클로저를 반환받아 전달
                let operation = button.getOperation()
                calculatorViewModel.inputOperation(operation)
            case .number(let value):
                calculatorViewModel.inputNumber(value) // 숫자를 Int로 전달
            }
            
            calculatorView.displayLabel.text = calculatorViewModel.displayText
        }
    }
    
}

