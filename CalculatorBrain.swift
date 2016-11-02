//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Masher Shin on 02/11/2016.
//  Copyright © 2016 Masher Shin. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "π":
            accumulator = M_PI
        case "√":
            accumulator = sqrt(accumulator)
        default:
            break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
