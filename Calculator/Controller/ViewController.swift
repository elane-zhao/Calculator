//
//  ViewController.swift
//  Calculator
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let num = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text into a double")
            }
            return num
        }
        set {
            //displayLabel.text = String(displayValue)
            //must set to newValue keyword!!
            displayLabel.text = String(format: "%g", newValue)
        }
    }
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calcLogic = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calcLogic.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {
            
            if let result = calcLogic.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad

        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    //if !(floor(displayValue) == displayValue) {
                    if displayLabel.text!.contains(".") {
                        return
                    }
                    
                }
                displayLabel.text! += numValue
            }
        }
    }

}

