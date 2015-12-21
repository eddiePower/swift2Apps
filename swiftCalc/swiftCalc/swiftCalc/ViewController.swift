//
//  ViewController.swift
//  swiftCalc
//
//  Created by Eddie Power on 28/06/2015.
//  Copyright (c) 2015 Eddie Power. All rights reserved.
//

import UIKit

//define class with Name (ViewController) then : for inheritence
// then the class inherited from UIViewController. - Swift is single
//inheritence (inheratence from a single class only).

class ViewController: UIViewController
{
    
    //instance variables or properties in swift.
    
    //Outlet is used to store variable code to UI object
    @IBOutlet weak var display: UILabel!
   
    var userIsTypingNumber = false
    
    //Action will send a object on a specific action occuring
    @IBAction func appendDigit(sender: UIButton)
    {
        //set const as optional button title sent, ! is used to unwrap value in optional.
        let digit = sender.currentTitle!
        
        
        
        if userIsTypingNumber
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text! = digit
            userIsTypingNumber = true
        }
        
        
        //swift NSLog equal is println()
        //println("The current number pressed was \(digit)")
    }

    @IBAction func operate(sender: UIButton)
    {
        //set var for button sent over
        let operation = sender.currentTitle!
        if userIsTypingNumber
        {
            //run our enter func to append digit to display
            enter()
        }
        
        switch operation
        {
            /*swift allows for inline functions using in key word
            and positioning of { }
            this line below can be slimmed down a lot
            preformOperation({ (op1: Double, op2: Double) -> Double  in return op1 * op2 })
            
            swift has type inference we can drop the types
            next since we decalared inline func below we can drop the return type completly.
            the argument names of op1 can also be dropped as it swift can use place holders
            Finally the () of the function can be removed as the function as argument is the only arg.
            there can be other args as well but they would be inside the parenthsies (arg1, arg2) { $1 * $4 }
            */
            
            case "×" : preformOperation { $0 * $1 }
            case "÷" : preformOperation { $1 / $0 }
            case "+" : preformOperation { $0 + $1 }
            case "−" : preformOperation { $1 - $0 }
            case "√" : preformSqrtOperation { sqrt($0) }
            case "?" : preformOperation { $0 + $1 }
            
            //temp clear key to clear the stack and display.
            case "c" : display.text = "0"
                        operandStack.removeAll(keepCapacity: true)
            
            default : break //break out of switch as not needed.
        }
        
    }
    
    // passing a function as arguments is ok just pass types so func operation will take 2 doubles and return a double.
    func preformOperation(runOperation: (Double, Double) -> Double)
    {
        //as we need 2 numbers to calc we make sure array has count of at least 2 objects.
        if operandStack.count >= 2
        {
            displayValue =  runOperation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
        
    }
    
    // passing a function as arguments is ok just pass types so func operation will take 2 doubles and return a double.
    func preformSqrtOperation(runOperation: Double -> Double)
    {
        //as we need 2 numbers to calc we make sure array has count of at least 2 objects.
        if operandStack.count >= 1
        {
            displayValue =  runOperation(operandStack.removeLast())
            enter()
        }
        
    }
    
    //create stack / memory space for numbers to be stored.
    // using an infered Array (as standard) of doubles and
    // initaliser ie: = Array
    var operandStack = Array<Double>()
    
    //ran when enter key is pressed on UI/storyboard.
    @IBAction func enter()
    {
        //set bool flag for user is typing to no
        userIsTypingNumber = false
        
        //set the display to a temp value of 0
        //display.text = "0"
        
        //set a new value into the operandStack or array
        // must be of the correct type (double)
        //using a computed double value of displayValue
        operandStack.append(displayValue)
        
        print("OperandStack = \(operandStack)")
        
    }
    
    
    //computed values, get/set the current string from display var as double. set: display to new number as string.
    var displayValue: Double
    {
        get
        {
            //return a string formated to a number, then displayed as a double value from number formatter.
           return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set
        {
            //magic variable always available is newValue being set / sent to setter.
            //convert double to string for seting to display
            display.text! = "\(newValue)"
            //set user is typing number flag to no
            userIsTypingNumber = false
        }
    }
    
}

