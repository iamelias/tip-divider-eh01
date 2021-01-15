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
    @IBOutlet weak var percentSegment: UISegmentedControl!
    
    var stepper: Int {
        return Int(peopleStepper.value)
    }
    
    var calc: Calculator!
    var calcViewModel: CalcViewModel!
    
    let percentsArray = [10,15,20,25]
    var selectedPercentage = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    @IBAction func percentTapped(_ sender: UISegmentedControl) {
        selectedPercentage = percentsArray[sender.selectedSegmentIndex] //selecting percentage to use
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        peopleStepper.value = sender.value
        numPeopLabel.text = "\(stepper)"
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        totalAmount.text = totalTextField.text
        guard let totalAmountD = totalAmount.text, let numPeopleLabelD = numPeopLabel.text else {
            return
        }
        
        calc = Calculator(totalAmount: Double(totalAmountD) ?? 0.0, numberOfPeople: Double(numPeopleLabelD) ?? 0.0)
        
        calcViewModel = CalcViewModel(calc: calc)
    }
    
    func setView() {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        totalTextField.resignFirstResponder()
        return true
    }
    
}

