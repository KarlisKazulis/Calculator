

import UIKit

class ViewController: UIViewController {
    
    //firstNumber secondNumber operator haveResult resultNumber numAfterResult
    
    var firstNum: String = ""
    
    var operation: String = ""
    
    var secondNum: String = ""
    
    var haveResult: Bool = false
    
    var resultNumber: String = ""
    
    var numAfterResult: String = ""
    
    
    
    
    //MARK: Outlets for each button
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
        
    }
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        operation = "X"
    }
    
    @IBAction func division(_ sender: Any) {
        operation = "/"
    }
    @IBAction func equals(_ sender: Any) {
        resultNumber = String(doOperation())
        
        //code below seperates the number in two parts, 10.0, 15.0 etc
        // if the digit behind . == 0, it runs numAfterResult = ""
        
        let numArray = resultNumber.components(separatedBy: ".")
        print(numArray)
        if numArray[1] == "0" {
            numOnScreen.text = numArray[0]
        }
        else {
            numOnScreen.text = resultNumber
        }
        numAfterResult = ""
    }
    
    
    
    // uses tag value to add numbers into the calculator
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {                        //if no operation buttons have been clicked
            firstNum += String(sender.tag)          // "" + "1" = "1"
            numOnScreen.text = firstNum
        }
        else if operation != "" && !haveResult {   //if operation button is clicked
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
        }
        else if operation != "" && haveResult {    //
            numAfterResult += String(sender.tag)
            numOnScreen.text = numAfterResult
        }
    }
    
    
    @IBAction func clear(_ sender: Any) {
        firstNum = ""
        operation = ""
        secondNum = ""
        haveResult = false
        resultNumber = ""
        numAfterResult = ""
        numOnScreen.text = "0"
        
    }
    @IBOutlet weak var numOnScreen: UILabel!
    @IBOutlet var calcButtons: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.size.height / 2; //changing the shape of the buttons
        }
        
        
    }
    
    // operations for adding, subtracting, multiplying and dividing
    func doOperation() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true                           //if we !haveresult, now we do
                return Double(firstNum)! + Double(secondNum)!
            }
            else {
                return Double(resultNumber)! + Double(numAfterResult)!
            }
        }
        
        else if operation == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else {
                return Double(resultNumber)! - Double(numAfterResult)!
            }
        }
        else if operation == "X" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else {
                return Double(resultNumber)! * Double(numAfterResult)!
            }
        }
        else if operation == "/" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else {
                return Double(resultNumber)! / Double(numAfterResult)!
            }
        }
        return 0
    }
}
