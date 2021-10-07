//
//  Calculator.swift
//  Calculator
//
//  Created by lollipop on 2021/10/5.
//

import Foundation

struct Calculator {
    enum Operation {
        case UnaryOp((Double) -> Double)
        case BinaryOp((Double, Double) -> Double)
        case EqualOp
        case Constant(Double)
    }
    
    let operations = [
        "+" : Operation.BinaryOp { $0 + $1 },
        "-" : Operation.BinaryOp { $0 - $1 },
        "x" : Operation.BinaryOp { $0 * $1 },
        "/" : Operation.BinaryOp { $0 / $1 },
        "=" : Operation.EqualOp,
        "C" : Operation.UnaryOp{ _ in 0.0},
        "+/-" : Operation.UnaryOp{ (-1.0) * $0},
        "%" : Operation.UnaryOp{ $0 / 100.0},
        "x^2" : Operation.UnaryOp {$0 * $0 },
        "x^3" : Operation.UnaryOp { $0 * $0 * $0},
        "x^y" : Operation.BinaryOp { pow($0, $1)},
        "e^x" : Operation.UnaryOp { exp($0)},
        "10^x" : Operation.UnaryOp {pow(10.0, $0)},
        "1/x" :Operation.UnaryOp { 1.0 / $0 },
        "2√x" : Operation.UnaryOp { sqrt($0) },
        "3√x" : Operation.UnaryOp { pow($0, 1.0/3.0)},
        "y√x": Operation.BinaryOp { pow($0, 1.0 / $1)},
        "ln" : Operation.UnaryOp { log($0) },
        "log10": Operation.UnaryOp { log10($0) },
        "x!" : Operation.UnaryOp {
            var sum = 1
            let x = Int($0)
            guard x >= 1 else {
                return 0.0
            }
            for i in 1...x {
                sum = sum * i
            }
            return Double(sum)
        },
        "sin" : Operation.UnaryOp { sin($0) },
        "cos" : Operation.UnaryOp { cos($0) },
        "tan" : Operation.UnaryOp { tan($0) },
        "e" : Operation.Constant(2.72),
        "EE" : Operation.BinaryOp { $0 * pow(10, $1) },
        "sinh" : Operation.UnaryOp { sinh($0) },
        "cosh" : Operation.UnaryOp { cosh($0) },
        "tanh" : Operation.UnaryOp { tanh($0) },
        "π" : Operation.Constant(3.14),
        "Rand" : Operation.Constant(drand48())
    ]
    
    struct Intermediate {
        var firstOp : Double
        var operation: (Double, Double) -> Double
    }
    
    var pendingOp: Intermediate?
    
    
  
    
    
    mutating func performOpration(operator possOperator: String, oprand: Double) -> Double? {
        if let realOp = operations[possOperator] {
            switch realOp {
            case Operation.UnaryOp(let function):
                return function(oprand)
            case Operation.BinaryOp(let function):
                pendingOp = Intermediate(firstOp: oprand, operation: function)
                return nil
            case Operation.EqualOp:
                if let possPendingOp = pendingOp {
                    pendingOp = nil
                    return possPendingOp.operation(possPendingOp.firstOp, oprand)
                }
                return nil
//                return pendingOp?.operation
            case Operation.Constant(let value):
                return value
                
            }
            
        }
        return nil
    }
    
    
    
}
