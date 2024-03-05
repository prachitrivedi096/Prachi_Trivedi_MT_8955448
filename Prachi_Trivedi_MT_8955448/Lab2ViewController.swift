//
//  Lab2ViewController.swift
//  Prachi_Trivedi_MT_8955448
//
//  Created by user236101 on 3/4/24.
//
//This file handles Lab 2 screen
import UIKit

class Lab2ViewController: UIViewController {
    var counter = 0
    var lableValue = 1
    var temp = 2
    
    @IBOutlet weak var lbl: UILabel!
    
    //On click of Decrease button, it decreases the value and setup the value in label
    @IBAction func btnDecrease(_ sender: Any) {
        counter = counter - lableValue
        lbl.text = String(counter)
    }
    //On click of Increase button, it increases the value and setup the value in label
    @IBAction func btnIncrease(_ sender: Any) {
        counter = counter + lableValue
        lbl.text = String(counter)
    }
    //On click of Reset button, it resets the value
    @IBAction func btnReset(_ sender: Any) {
        counter = 0
        lbl.text = String(counter)
        lableValue = 1
    }
    //On click of Step 2 button, it sets label value to 2
    @IBAction func btnStep2(_ sender: Any) {
        lableValue = 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
