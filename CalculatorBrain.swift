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
        case binaryOperation
        case equals
    }
    
    private var accumulator = 0.0
    
    var operations: Dictionary<String, Operation> = [
        "π": .constant(M_PI),
        "e": .constant(M_E),
        "√": .unaryOperation(sqrt),
        "cos": .unaryOperation(cos)
    ]
    
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
            case .binaryOperation:
                break
            case .equals:
                break
            }
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
