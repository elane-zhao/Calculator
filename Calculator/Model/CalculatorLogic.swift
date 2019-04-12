//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Xinyi Zhao on 4/10/19.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (calcMethod: String, n1: Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
            } else if symbol == "%" {
                return n * 0.01
            } else if symbol == "=" {
                return performTwoNumCalc(n2: n)
            } else {
                intermediateCalculation = (symbol, n)
            }
            
        }
        return nil
    }
    
    private func performTwoNumCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let calcmethod = intermediateCalculation?.calcMethod {
            
            switch calcmethod {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("the operator passed in does not match any of the cases")
            }
        }
        return nil;
    }
    
    
}
