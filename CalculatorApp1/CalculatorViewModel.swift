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
    private var lastInputWasOperation: Bool = false // 마지막 입력이 연산자인지 추적
    private var hasNumberInput: Bool = false // 숫자가 입력되었는지 상태 추적
    
    // 숫자를 입력할 때 처리하는 메서드
    func inputNumber(_ number: Int) {
        if displayText == "0" || lastInputWasOperation { // 0이거나 연산자 입력 후 새 숫자 시작
            displayText = "\(number)"
        } else {
            displayText += "\(number)"
        }
        lastInputWasOperation = false // 숫자 입력 후 연산자 대기 상태 해제
        hasNumberInput = true // 숫자가 입력되었음을 기록
    }
    
    /// 연산자 버튼을 눌렀을 때 호출
    func inputOperation(_ operation: @escaping (Int, Int) -> Int) {
        // 숫자가 입력되지 않은 상태에서 연산자 입력 시 무시
        if !hasNumberInput {
            print("Error: Cannot input an operator without a number.")
            return
        }
        
        // 연속된 연산자 입력 방지
        if lastInputWasOperation {
            print("Error: Cannot input two operators consecutively.")
            return
        }
        
        if let value = Int(displayText) {
            // 현재 입력된 숫자를 모델에 전달하여 연산 처리
            model.calculate(with: value)
            model.setOperation(operation)
            displayText = "0"  // 다음 숫자를 위한 초기화
            lastInputWasOperation = true // 연산자가 입력되었음을 기록
        }
    }
    
    // = 버튼을 눌렀을 때 호출하여 최종 결과를 계산
    func calculateResult() {
        // 숫자가 없는 상태에서 "=" 버튼을 누르면 무시
        if !hasNumberInput {
            print("Error: Cannot calculate without a valid number.")
            return
        }
        
        if let value = Int(displayText) {
            let result = model.calculate(with: value)
            displayText = "\(result)"
            hasNumberInput = false // 계산이 끝났으므로 초기 상태로 변경
        }
    }
    
    // AC 버튼을 눌렀을 때 초기화
    func reset() {
        model.reset()
        displayText = "0"
        lastInputWasOperation = false
        hasNumberInput = false
    }
}
