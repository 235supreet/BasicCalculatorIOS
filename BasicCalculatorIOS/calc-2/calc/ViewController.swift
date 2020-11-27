//
//  ViewController.swift
//  calc
//
//  Created by Supreet Singh on 09/11/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var operation = 0
    var firstnumber:Double = 0
    var percentTest:Bool = false
    var operationPer = 0
    
    @IBOutlet weak var ResultLabel: UILabel!
    
    @IBAction func AddSubtractButton(_ sender: Any) {
        ResultLabel.text = String(Int(ResultLabel.text!)! * -1)
        }
    
    @IBAction func Decimal(_ sender: Any) {
        ResultLabel.text = ResultLabel.text! + String(".")
        currentNumber = Double(ResultLabel.text!)!
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true {
            ResultLabel.text = String(sender.tag - 1)
            currentNumber = Double(ResultLabel.text!)!
            performingMath = false
        }
        else {
            ResultLabel.text = ResultLabel.text! + String(sender.tag - 1)
            currentNumber = Double(ResultLabel.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if ResultLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousNumber = Double(ResultLabel.text!)!
            if sender.tag == 12 {
                ResultLabel.text = "÷"
                firstnumber = previousNumber
                
            }
            else if sender.tag == 13 {
                ResultLabel.text = "x"
                firstnumber = previousNumber
                
            }
            else if sender.tag == 14 {
                ResultLabel.text = "-"
                firstnumber = previousNumber
                
            }
            else if sender.tag == 15 {
                ResultLabel.text = "+"
                firstnumber = previousNumber
                
            }
            else if sender.tag == 17 {
                ResultLabel.text = "%"
                if (sender.tag != 0 && operation == 15 || operation == 14 || operation == 13 || operation == 12){
                    currentNumber = firstnumber * previousNumber
                    currentNumber /= 100
                    previousNumber = firstnumber
                    percentTest = true
                    operationPer = operation
                }else {
                previousNumber /= 100
                }
                
                
            }
            if percentTest == true {
                operation = operationPer
                percentTest = false
            }else{
            operation = sender.tag
            }
            performingMath = true
            
        }
        else if sender.tag == 16 {
            if operation == 12 {
                ResultLabel.text = String(previousNumber / currentNumber)
            }
            else if operation == 13 {
                ResultLabel.text = String(previousNumber * currentNumber)
            }
            else if operation == 14 {
                ResultLabel.text = String(previousNumber - currentNumber)
            }
            else if operation == 15 {
                ResultLabel.text = String(previousNumber + currentNumber)
            }
            else if operation == 17 {
                ResultLabel.text = String(format: "%.2f",  (previousNumber * currentNumber))
            }
        }
        else if sender.tag == 11 {
            ResultLabel.text = ""
            currentNumber = 0
            previousNumber = 0
            operation = 0
            firstnumber = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

