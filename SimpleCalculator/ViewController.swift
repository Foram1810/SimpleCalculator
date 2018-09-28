//  File Name: ViewController.swift
//  App des: SimpleCalculator
//  Created by ForumPatel on 2018-09-26.
//  StudentId: 301042440
// Version : 1.0

import UIKit

class ViewController: UIViewController {
// create variables
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var operation: Int = 0;
    var count: Int = 0;
    
    var performingMath = false;
    var complete = false;
    var isInteger = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultArea.text="0"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    //   Created label
    @IBOutlet weak var resultArea: UILabel!
    
    // all Number buttons linked
    @IBAction func onNumberClk(_ sender: UIButton) {
        
        if performingMath == true {
            
            resultArea.text = String(sender.tag)
            
            numberOnScreen = Double(resultArea.text!)!
            
            performingMath = false
            
        }
      
        else if sender.tag == -1 {
            if resultArea.text == "0" {
                resultArea.text = "0."
            }
            else {
                let countdots = resultArea.text!.components(separatedBy: ".").count - 1
                if countdots == 0 {
                    resultArea.text = resultArea.text! + "."
                }
            }
        }
        else if (performingMath || complete || resultArea.text == "0") {
            resultArea.text = String(sender.tag)
            performingMath = false
            complete = false
            
        }
        else {
            resultArea.text = resultArea.text! + String(sender.tag)
        }
        numberOnScreen = Double(resultArea.text!)!
    }
    
    // calculations of arithmetic buttons
    @IBAction func buttons(_ sender: UIButton) {
        
        if resultArea.text != "" && sender.tag != 11 && sender.tag != 16{
            
            previousNumber = Double(resultArea.text!)!
            
            if sender.tag == 12 { //Divide
                
                resultArea.text = "/";
                
            }
            
            if sender.tag == 13 { //Multiply
                
                resultArea.text = "x";
                
            }
            
            if sender.tag == 14 { //Subtract
                
                resultArea.text = "-";
                
            }
            
            if sender.tag == 15 { //Add
                
                resultArea.text = "+";
                
            }
            
            if sender.tag == 17 { //Percentage
                resultArea.text = String(numberOnScreen);
            }
            
            operation = sender.tag
            
            performingMath = true;
            
        }
            
        else if sender.tag == 16 {
            
            if operation == 12{ //Divides
               // if numberOnScreen == 0 {
                //    resultArea.text = "In"
               // }
                resultArea.text = String(previousNumber / numberOnScreen)
                
            }
                
            else if operation == 13{ //Multiply
                
                resultArea.text = String(previousNumber * numberOnScreen)
                
            }
                
            else if operation == 14{ //Subtract
                
                resultArea.text = String(previousNumber - numberOnScreen)
                
            }
                
            else if operation == 15{ //Add
                
                resultArea.text = String(previousNumber + numberOnScreen)
                
            }
            
            else if operation == 17{ //Percentage
                
                resultArea.text = String((numberOnScreen) / (previousNumber * 100)) + "%"
           }
            
        }
            
        else if sender.tag == 11{
            
            resultArea.text = "0";
            
            previousNumber = 0;
            
            numberOnScreen = 0;
            
            operation = 0;
            
        }
}
}
