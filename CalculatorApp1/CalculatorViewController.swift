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
    
    weak var delegate: HighlightableViewDelegate?
    
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
        guard let title = sender.currentTitle else { return }
        sender.setTitle(title, for: .highlighted)
        UIView.animate(withDuration: 0.1) { [self] in
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            switch title {
            case "AC":
                calculatorViewModel.reset()
            case "=":
                calculatorViewModel.calculateResult()
            case "+":
                calculatorViewModel.inputOperation(+)
            case "-":
                calculatorViewModel.inputOperation(-)
            case "*":
                calculatorViewModel.inputOperation(*)
            case "/":
                calculatorViewModel.inputOperation(/)
            default:
                if let number = Int(title) {
                    calculatorViewModel.inputNumber(number) // View 에서는 숫자를 Int로 다 넘겨 준다.
                }
            }
            calculatorView.displayLabel.text = calculatorViewModel.displayText
        }
    }
    
}

