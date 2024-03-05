//
//  ViewController.swift
//  Prachi_Trivedi_MT_8955448
//
//  Created by user236101 on 2/27/24.
//
//This file is associated with Canada Scene
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var cityImgView: UIImageView!
    
    @IBOutlet weak var lblError: UILabel!
    
    //Declared string and image arrays
    var cityName : [String] = ["Halifax", "Toronto", "Vancouver", "Winnipeg", "Calgary", "Montreal"]
    
    var cityImage : [UIImage?] = [UIImage(named: "Halifax"), UIImage(named: "Toronto"), UIImage(named: "Vancouver"), UIImage(named: "Winnipeg"), UIImage(named: "Calgary"), UIImage(named: "Montreal")]
    
    //On click of Find City button, function will check validation, match user input with string array and display image accordingly
    @IBAction func btnFindCity(_ sender: Any) {
        guard let inputText = txtCity.text?.trimmingCharacters(in: .whitespacesAndNewlines), !inputText.isEmpty else {
            lblError.text = "Field Cannot be empty"
            lblError.isHidden = false
            return
        }
        if let index = cityName.firstIndex(of: inputText){
            cityImgView.image = cityImage[index]
            lblError.isHidden = true
        } else {
            lblError.text = "City not found"
            lblError.isHidden = false
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Default (Canada) Image setup after loading the view.
        cityImgView.image = UIImage(named: "Canada")
        lblError.isHidden = true
        
        txtCity.delegate = self
        //To dismiss the keyboar using TapGesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
                
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //To handle Return key of keyboard and dismiss the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
       }
}

