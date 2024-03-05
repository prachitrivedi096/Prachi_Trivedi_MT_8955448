//
//  CalculateViewController.swift
//  Prachi_Trivedi_MT_8955448
//
//  Created by user236101 on 3/2/24.
//
//This file handles Quadratic Formula
import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtA: UITextField!
    @IBOutlet weak var txtB: UITextField!
    @IBOutlet weak var txtC: UITextField!
    
    @IBOutlet weak var lblFormula: UILabel!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    //On Click of Calculate button, function will calculate validation messages and quadratic formula
    @IBAction func btnCalculate(_ sender: UIButton) {
        //To reset the value of X on click calculate button again
        lblFormula.text = ""
        
        //Checking whether inputtext is empty or not
        guard let  valueA  = txtA.text, !valueA.isEmpty,
              let  valueB = txtB.text, !valueB.isEmpty,
              let  valueC = txtC.text, !valueC.isEmpty  else
        {
            print("Enter a value of A, B and C to find x")
            lblMessage.text = "Enter a value of A, B, and C to find x"
            lblMessage.isHidden = false
            
            return
        }

        var errorMessage = ""
        //Calculating and displaying the value of X and displaying appropriate message
        if let a = Double(valueA), let b = Double(valueB), let c = Double(valueC) {
            
            let discriminant = b * b - 4 * a * c
            if discriminant < 0 {
                print("Answer is nagative")
                errorMessage = "There are no results since the discriminant is less than zero."
            }
            else if discriminant == 0 {
                let x = -b / (2 * a)
                lblMessage.text = "The discriminant is zero."
                lblMessage.isHidden = false
                
                lblFormula.text = "x = \(String(format:"%.4f", x))"
                lblFormula.isHidden = false
                print("Answer is \(x)")
            }
            else {
                let x1 = (-b + sqrt(discriminant)) / (2 * a)
                let x2 = (-b - sqrt(discriminant)) / (2 * a)
                
                lblFormula.text = "X = \(String(format: "%.4f", x1)), \(String(format: "%.4f", x2))"
                lblFormula.isHidden = false
                
                lblMessage.text = "There are two values for X"
                lblMessage.isHidden = false
                print("Answer is \(x1), \(x2)")
            }
        }
        else {
            // Handle invalid input (non-numeric characters)
            if valueA.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
                //lblMessage.text = "The value you entered for A is invalid."
                errorMessage += "The value you entered for A is invalid. \n"
                
            }
            if valueB.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
                //lblMessage.text = "The value you entered for B is invalid."
                errorMessage += "The value you entered for B is invalid. \n"
            }
            if valueC.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil {
                //lblMessage.text = "The value you entered for C is invalid."
                errorMessage += "The value you entered for C is invalid. \n"
            }
            lblMessage.isHidden = false
        }
        if !errorMessage.isEmpty {
                lblMessage.text = errorMessage
                lblMessage.isHidden = false
            }
    }
    //On click of Clear button, resetting the values of input and displaying a message
    @IBAction func btnClear(_ sender: UIButton) {
        txtA.text = ""
        txtB.text = ""
        txtC.text = ""
        
        lblFormula.isHidden = true
        lblMessage.text = "Enter a value for A, B and C to find x"
        lblMessage.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.isHidden = true
        lblFormula.isHidden = true
        
        txtA.delegate = self
        txtB.delegate = self
        txtC.delegate = self
        
        //Displaying numberpad keyboard
        txtA.keyboardType = .numberPad
        txtB.keyboardType = .numberPad
        txtC.keyboardType = .numberPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    @objc func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
           let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
           
           // Display the updated text directly in the text field
           textField.text = updatedText
    
            return false // Prevent the default behavior of appending characters
    }
}
