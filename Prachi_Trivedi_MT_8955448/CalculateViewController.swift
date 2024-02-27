//
//  CalculateViewController.swift
//  Prachi_Trivedi_MT_8955448
//
//  Created by user236101 on 3/2/24.
//

import UIKit

class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtA: UITextField!
    @IBOutlet weak var txtB: UITextField!
    @IBOutlet weak var txtC: UITextField!
    
    //@IBOutlet weak var txtMessage: UILabel!
    @IBOutlet weak var lblFormula: UILabel!
    
    @IBOutlet weak var txtMessage: UITextView!
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        
        guard let  valueA  = txtA.text, !valueA.isEmpty, let a = Double(valueA),
              let  valueB = txtB.text, !valueB.isEmpty, let b = Double(valueB),
              let  valueC = txtC.text, !valueC.isEmpty , let c = Double(valueC) else
        {
            //print("Enter a value of A, B and C to find x")
            txtMessage.text = "Enter a value of A, B, and C to find x"
            txtMessage.isHidden = false
            return
        }
        
        let discriminant = b * b - 4 * a * c
        if discriminant < 0 {
            txtMessage.text = "There are no results since the discriminant is less than zero."
            txtMessage.isHidden = false
            //print("Answer is nagative")
        }
        else if discriminant == 0 {
            let x = -b / (2 * a)
            txtMessage.text = "The discriminant is less than zero."
            txtMessage.isHidden = false
            
            lblFormula.text = "x = \(String(format:"%.4f", x))"
            lblFormula.isHidden = false
            //print("Answer is \(x)")
        }
        else {
            let x1 = (-b + sqrt(discriminant)) / (2 * a)
            let x2 = (-b - sqrt(discriminant)) / (2 * a)
            
            lblFormula.text = "X = \(String(format: "%.4f", x1)), \(String(format: "%.4f", x2))"
            lblFormula.isHidden = false
            
            txtMessage.text = "There are two values for X"
            txtMessage.isHidden = false
            
            //print("Answer is \(x1), \(x2)")
        }
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        txtA.text = ""
        txtB.text = ""
        txtC.text = ""
        
        txtMessage.text = "Enter a value for A, B and C to find x"
        txtMessage.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMessage.isHidden = true
        lblFormula.isHidden = true
        
        txtA.delegate = self
        txtB.delegate = self
        txtC.delegate = self
        
        txtA.keyboardType = .numberPad
        txtB.keyboardType = .numberPad
        txtC.keyboardType = .numberPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
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
        
        // Validate that the entered string is numeric
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        let isValid = allowedCharacters.isSuperset(of: characterSet)
        
        // Display appropriate message for invalid input
        if !isValid {
            if textField == txtA {
                txtMessage.text = "The value you entered for A is invalid."
                txtMessage.isHidden = false
            } else if textField == txtB {
                txtMessage.text = "The value you entered for B is invalid."
                txtMessage.isHidden = false
            } else if textField == txtC {
                txtMessage.text = "The value you entered for C is invalid."
                txtMessage.isHidden = false
            }
        }
        // Update the text field's text if the entered string is valid
            if isValid {
                textField.text = updatedText
            }
            
            return false // Prevent the default behavior of appending characters
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
