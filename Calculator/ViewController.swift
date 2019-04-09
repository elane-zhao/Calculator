//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var num: String = "" {
        didSet {
            if let numLabel = displayLabel.text {
                if numLabel.elementsEqual("0") {
                    displayLabel.text = num
                } else {
                    displayLabel.text! += num
                }
            }
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed

        displayLabel.text = "0"
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad

        if let numValue = sender.currentTitle {
            num = numValue
        }
    }

}

