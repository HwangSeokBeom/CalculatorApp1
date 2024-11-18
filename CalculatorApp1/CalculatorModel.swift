//
//  CalculatorModel.swift
//  RemindCalulatorApp
//
//  Created by Hwangseokbeom on 11/17/24.
//

import Foundation

class CalculatorModel {
    
    private var currentValue: Int = 0
    private var pendingOperation: ((Int, Int) -> Int)? // (+), (-)와 같이 ViewController에서 클로저로 보내기 때문에
        
    
    // 연산자를 설정합니다.
    func setOperation(_ operation: @escaping (Int, Int) -> Int){
        pendingOperation = operation
    }
    
    // 주어진 값으로 연산을 수행하고 중간 결과를 유지합니다.
    func calculate(with value: Int) -> Int {
        if let operation = pendingOperation { // 연산자가 안들어 왔으면 값 그대로 보냄
            currentValue = operation(currentValue, value)
            pendingOperation = nil  // 연산을 수행한 후 초기화
        } else {
            currentValue = value  // 첫 연산의 경우, 단순히 값을 설정
        }
        return currentValue
    }
    
    func reset() {
        currentValue = 0
        pendingOperation = nil
    }
}
