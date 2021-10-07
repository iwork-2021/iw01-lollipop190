//
//  CalculatorModel.swift
//  Calculator
//
//  Created by lollipop on 2021/10/6.
//

import Foundation
import SwiftUI

struct CalculatorModel {
    var items: [[Item]]
    var result: String = "0"
    var isLandscape = false
    var showedResult: String {
        if let doubleNum = Double(result){
            let intNum = Int(doubleNum)
            if doubleNum == Double(intNum) {
                return String(intNum)
            }
        }
        
        return result
    }
    private(set) var calculator = Calculator()
    private(set) var inTypingMode = false
    mutating func handleTap(itemText: String){
        switch getActionType(itemText: itemText) {
        case .oprand:
            handleOprand(itemText: itemText)
        case .oprtr:
            handleOperator(itemText:itemText)
        }
    }
    
    mutating private func handleOprand(itemText: String) {
        if inTypingMode {
            result = (result == "0") ? itemText : result + itemText
        } else {
            result = itemText
            inTypingMode = true
        }
    }
    mutating private func handleOperator(itemText: String) {
        guard let resultNum = Double(result) else {
            fatalError("error")
        }
        if let newResult = calculator.performOpration(operator: itemText, oprand: resultNum) {
            result = String(newResult)
        }
        inTypingMode = false
    }
    
    
    private func getActionType(itemText: String) -> ButtonAction {
        if itemText == "." {
            return ButtonAction.oprand
        }
        if Int(itemText) != nil {
            return ButtonAction.oprand
        }
        return ButtonAction.oprtr
    }
    

    mutating func changeOrientation(_ isLandscape: Bool) {
        
        //to be deleted
        self.isLandscape = isLandscape
      
            for vitemIndex in items.indices {
                for index in 0..<6 {
                    items[vitemIndex][index].isShown = isLandscape
                }
            }
        
    }
    
    enum ButtonAction {
        case oprand
        case oprtr
        

    }
    
    
}
