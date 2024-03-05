//
//  Lab3ViewController.swift
//  Prachi_Trivedi_MT_8955448
//
//  Created by user236101 on 3/5/24.
//

import UIKit

class Lab3ViewController: UIViewController {

    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var txtUserInfo: UITextView!
    
    @IBOutlet weak var lblMsg: UILabel!
    
    //On click of Add button, it adds input text values to textview
    @IBAction func btnAdd(_ sender: Any){
        let firstName = txtFname.text
        let lastName = txtLname.text
        let country = txtCountry.text
        let age = txtAge.text
        
        txtUserInfo.text = " First Name: \(firstName ?? "") \(lastName ?? "") \n Country : \(country ?? "") \n Age : \(age ?? "")"
        lblMsg.isHidden = true
    }
    //On click of Submit button, it checks user input validation and displays message accordingly
    @IBAction func btnSubmit(_ sender: Any) {
        if txtFname.text?.isEmpty == true || txtLname.text?.isEmpty == true || txtCountry.text?.isEmpty == true || txtAge.text?.isEmpty == true
        {
            lblMsg.text = "Complete the missing info!"
            lblMsg.isHidden = false
        }
        else
        {
            lblMsg.text = "Successfully Submitted!"
            lblMsg.isHidden = false
        }
            
    }
    //On click of Clear button, it resets the value of text fields
    @IBAction func btnClear(_ sender: Any) {
        txtFname.text = ""
        txtLname.text = ""
        txtCountry.text = ""
        txtAge.text = ""
        txtUserInfo.text = ""
        
        lblMsg.isHidden = true
        
        txtFname.becomeFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lblMsg.isHidden = true
        // Do any additional setup after loading the view.
    }
}
