//
//  ViewController.swift
//  TipDivider
//
//  Created by Elias Hall on 1/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var numPeopLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!

    var calculator: Calculator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTextField.delegate = self
        calculator = Calculator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }

    @IBAction func stepperTapped(_ sender: UIStepper) {
        peopleStepper.value = sender.value
        numPeopLabel.text = "\(Int(peopleStepper.value))"
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        totalAmount.text = totalTextField.text
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        totalTextField.resignFirstResponder()
        return true
    }
    
}

