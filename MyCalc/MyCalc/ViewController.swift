//
//  ViewController.swift
//  MyCalc
//
//  Created by user on 15.10.2022.
//

import UIKit

class ViewController:  UIViewController {
    // Calculation display line
    @IBOutlet weak var resultConsole: UILabel!
    // Variable for first number
    var operand : String = ""
    // Variable for second number
    var numberOne: String = ""
    // Variable for operand
    var numberTwo: String = ""
    // Variable for result
    var result: Double = 0.0
    
    // function for pressing numbers
    @IBAction func tappedDigital(_ sender: UIButton) {
        if operand.isEmpty {
            numberOne += (sender.titleLabel?.text)!
            resultConsole.text = numberOne
        } else {
            numberTwo += (sender.titleLabel?.text)!
            resultConsole.text = numberTwo
        }
    }
    // Operand button click handler fucntion
    @IBAction func tappedOperand(_ sender: UIButton) {
        operand = (sender.titleLabel?.text)!
    }
    // Calculator reset function
    @IBAction func clearCalc(_ sender: UIButton) {
        numberOne = ""
        numberTwo = ""
        operand = ""
        resultConsole.text = "0"
    }
    // Result button click handler fucntion
    @IBAction func resultAction(_ sender: UIButton) {
        switch operand {
        case "+":
            result = addition(a: numberOne, b: numberTwo)
        case "-":
            result = subtraction(a: numberOne, b: numberTwo)
        case "*":
            result = multiplication(a: numberOne, b: numberTwo)
        case "/":
            result = division(a: numberOne, b: numberTwo)
        default:
            break
        }
        showResult(number: result)
    }
        
    func addition(a: String, b: String) -> Double {
        return Double(a)! + Double(b)!
    }
    
    func division(a: String, b: String) -> Double {
        return Double(a)! / Double(b)!
    }

    func multiplication(a: String, b: String) -> Double {
        return Double(a)! * Double(b)!
    }

    func subtraction(a: String, b: String) -> Double {
        return Double(a)! - Double(b)!
    }
    func showResult(number: Double) {
        if number.truncatingRemainder(dividingBy: 1.0) == 0.0 {
            resultConsole.text = String(Int(number))
        } else {
            resultConsole.text = String(number)
        }
    }
    
}

