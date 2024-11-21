//
//  CalculatorViewModel.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/17/24.
//

import Foundation

class CalculatorViewModel {
    private let model = CalculatorModel()
    private(set) var displayText: String = "0" // 기본은 0, 데이터 무결성 보장, 외부에서 수정 x
    
    // 숫자를 입력할 때 처리하는 메서드
    func inputNumber(_ number: Int) {
        if displayText == "0" || displayText == "오류" { // 0이거나 연산자 입력 후 새 숫자 시작
            displayText = "\(number)"
        } else {
            displayText += "\(number)"
        }
    }
    
    // 연산자 버튼을 눌렀을 때 호출
    func inputOperation(_ operation: @escaping (Int, Int) -> Int) {
        if let value = Int(displayText) {
            // 현재 입력된 숫자를 모델에 전달하여 연산 처리
            model.calculate(with: value)
            model.setOperation(operation)
            displayText = "0"  // 다음 숫자를 위한 초기화
        }
    }
    
    // = 버튼을 눌렀을 때 호출하여 최종 결과를 계산
    func calculateResult() {
        if let value = Int(displayText) {
            if let result = model.calculate(with: value){
                displayText = "\(result)"
            }
            else{
                displayText = "오류"
            }
        }
    }
    
    // AC 버튼을 눌렀을 때 초기화
    func reset() {
        model.reset()
        displayText = "0"
    }
}
