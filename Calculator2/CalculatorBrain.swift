//
//  CalculatorBrain.swift
//  Calculator2
//
//  Created by Amjad on 7/24/1438 AH.
//  Copyright © 1438 Amjad. All rights reserved.
//

import Foundation

class CalculatorBrain {
    private var accumulator = 0.0
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    
    var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constent(M_PI),//M_PI,
        "e" : Operation.Constent(M_E),//M_E
        "√" : Operation.UnaryOperation (sqrt),
        "cos" : Operation.UnaryOperation (cos)
    ]
    
    enum Operation {
        case Constent(Double)
        case UnaryOperation ((Double)->Double)
        case BinaryOperation ((Double,Double)->Double)
        case Equals
    }
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constent(let value): accumulator = value
            case .UnaryOperation (let function): accumulator = function(accumulator)
            case .BinaryOperation : break
            case .Equals : break
            }
        }
    }
    
    var result: Double {
        get {
            return 0.0
        }
    }
    
}
