//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Masher Shin on 02/11/2016.
//  Copyright © 2016 Masher Shin. All rights reserved.
//

import Foundation

class CalculatorBrain {
    enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    struct PendingBinaryOperationInfo {
        var binaryFuction: (Double, Double) -> Double
        var firstOperand: Double
    }
    
    private var accumulator = 0.0
    private var pending: PendingBinaryOperationInfo?
    
    private var operations: Dictionary<String, Operation> = [
        "π": .constant(M_PI),
        "e": .constant(M_E),
        "√": .unaryOperation(sqrt),
        "cos": .unaryOperation(cos),
        "+": .binaryOperation({ $0 + $1 }),
        "−": .binaryOperation({ $0 - $1 }),
        "×": .binaryOperation({ $0 * $1 }),
        "÷": .binaryOperation({ $0 / $1 }),
        "=": .equals
    ]
    
    private func excutePendingBinaryOperation() {
        if let info = pending {
            accumulator = info.binaryFuction(info.firstOperand, accumulator)
            pending = nil
        }
    }
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                accumulator = function(accumulator)
            case .binaryOperation(let function):
                excutePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFuction: function, firstOperand: accumulator)
            case .equals:
                excutePendingBinaryOperation()
            }
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
