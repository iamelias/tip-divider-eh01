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
    
    var stepper: Double {
        return peopleStepper.value
    }
    
    var calc: Calculator {
        return Calculator(totalAmount: Double(totalTextField.text ?? "") ?? 2.0, numberOfPeople: stepper, tipPercentage: selectedPercentage)
    }
    
    var calcViewModel: CalcViewModel {
        return CalcViewModel(calc: calc)
    }
    
    let percentsArray: [Double] = [1.0,0.10,0.15,0.20,0.25]
    var selectedPercentage: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTextField.delegate = self
    }

    @IBAction func percentTapped(_ sender: UISegmentedControl) {
        selectedPercentage = percentsArray[sender.selectedSegmentIndex] //selecting percentage to use
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        numPeopLabel.text = "\(Int(stepper))"
        
        //peopleStepper.value = sender.value //stepper value
        //print("people stepper value: \(peopleStepper.value)")
        //numPeopLabel.text = "\(stepper)"
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        setView()
    }
    
    func setView() {
        totalAmount.text = calcViewModel.totalAmount //Total amount label
        tipPerPerson.text = calcViewModel.tipPerPerson
        selectedPercentage = calcViewModel.tipPercentage //selected percentage being used
        percentSegment.selectedSegmentIndex = percentsArray.firstIndex {$0 == selectedPercentage} ?? 0 //index of selected percentage in array
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        totalTextField.resignFirstResponder()
        return true
    }
    
}

