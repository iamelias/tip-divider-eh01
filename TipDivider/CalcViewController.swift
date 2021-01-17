//
//  ViewController.swift
//  TipDivider
//
//  Created by Elias Hall on 1/10/21.
//

import UIKit

class CalcViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var totalTextField: UITextField!
    @IBOutlet weak var numPeopLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var percentSegment: UISegmentedControl!
    
    var stepper: Double {
        return peopleStepper.value
    }
    
    var calc: Calculator {
        return Calculator(totalAmount: Double(totalTextField.text ?? "") ?? 0.0, numberOfPeople: stepper, tipPercentage: selectedPercentage)
    }
    
    var calcViewModel: CalcViewModel { 
        return CalcViewModel(calc: calc)
    }
    
    let percentsArray: [Double] = [1.0,0.10,0.15,0.20,0.25]
    var selectedPercentage: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTextField.delegate = self
        calculateButton.roundCorners() //rounding corners of calculate button
    }

    @IBAction func percentTapped(_ sender: UISegmentedControl) {
        selectedPercentage = percentsArray[sender.selectedSegmentIndex] //selecting percentage to use
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) { //Stepper tapped
        numPeopLabel.text = "\(Int(stepper))"
        calculateButton.backgroundColor = .systemYellow //Stepper tap changes color to yellow
    }
    
    @IBAction func calculateTapped(_ sender: Any) { //Calculate button tapped
        setView()
    }
    
    func setView() { //Setting view from ViewModel data
        calculateButton.backgroundColor = .systemTeal
        totalAmount.text = calcViewModel.totalAmount //Total amount label
        tipPerPerson.text = calcViewModel.tipPerPerson
        selectedPercentage = calcViewModel.tipPercentage //selected percentage being used
        percentSegment.selectedSegmentIndex = percentsArray.firstIndex {$0 == selectedPercentage} ?? 0 //index of selected percentage in array
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { //Dismissing keyboard when return is tapped
        totalTextField.resignFirstResponder()
        return true
    }
}

//View
extension UIButton {
    func roundCorners() { //Rounding corners of UIButtons
        let cRadius = bounds.maxX / 20
        layer.cornerRadius = cRadius
    }
}
