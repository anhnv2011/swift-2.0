//
//  ViewController.swift
//  Calculator
//
//  Created by anh  nguyen viet on 7/27/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var distanceBetweeninputTextFieldandResultLabel: NSLayoutConstraint!
    
    @IBOutlet weak var distanceBetweenResultLabelAndMiddleview: NSLayoutConstraint!
    
    
    var isTappingNumber : Bool = false
    var isEndOperation : Bool = false
    var firstNumber : Double = 0
    var secondNumber : Double = 0
    var operation : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func updateViewConstraints()
    {
     super.updateViewConstraints()
        updateConstraints()
        
    }
    
    
   func updateConstraints () -> Void
   {
    let scale = UIScreen.mainScreen().bounds.size.height/667   // 667 la chieu cao cua man iphone 6
    distanceBetweenResultLabelAndMiddleview.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweenResultLabelAndMiddleview.constant * scale : distanceBetweenResultLabelAndMiddleview.constant * 0.1
    distanceBetweeninputTextFieldandResultLabel.constant = UIScreen.mainScreen().bounds.size.height > 480 ? distanceBetweeninputTextFieldandResultLabel.constant * scale : distanceBetweeninputTextFieldandResultLabel.constant * 0.1
    
    
    }
    
    @IBAction func numberAction(sender: UIButton) {
        
        let number = sender.currentTitle
        if isTappingNumber {
            inputTextField.text = inputTextField.text! + number!
        }else{
            inputTextField.text = number
            isTappingNumber = true
        }
    }
    
    @IBAction func operatorsAction(sender: UIButton) {
        operation = sender.currentTitle!
        
        if let inputOperation = Double(inputTextField.text!){
            
            if isEndOperation {
                firstNumber = inputOperation
                isEndOperation = false
            }else{
                firstNumber = Double(resultLabel.text!)!
                
                inputTextField.text = "\(firstNumber)"
            }
            
        }else{
            print("Ban can nhap so vao truoc khi thuc hien tinh toan")
        }
        
        isTappingNumber = false
        
        if operation == "%" {
            equalAction(sender)
        }else if operation == "+/-"{
            equalAction(sender)
        }
    }
    @IBAction func acAction(sender: UIButton) {
        firstNumber = 0
        secondNumber = 0
        inputTextField.text = ""
        resultLabel.text = "0"
        isEndOperation = true
    }
    
    @IBAction func equalAction(sender: UIButton) {
        isTappingNumber = false
        
        var result : Double = 0
        
        if let realSecondNumber = Double(inputTextField.text!) {
            secondNumber = realSecondNumber
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber / 100
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else{
                firstNumber = -1 * firstNumber
                result = firstNumber
            }
            inputTextField.text = "\(result)"
        default:
            print("Error Operation")
        }
        
        resultLabel.text = "\(result)"
    }
    
}

