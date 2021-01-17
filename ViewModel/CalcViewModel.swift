//
//  CalcViewModel.swift
//  TipDivider
//
//  Created by Elias Hall on 1/11/21.
//

import Foundation

class CalcViewModel {
    
    var calc: Calculator
    var totalAmount: String {
        
        return "$" + String(format: "%.2f", calc.totalAmount) //creating $0.00 format
    }
    var numberOfPeople: String {
        return "\(Int(calc.numberOfPeople))"
    }
    
    var tipPerPerson: String { //Decimal $ amount / person
        return "Tip: $" + String(format: "%.2f", calc.tipPerPerson) + "/person" //creating $0.00 format
    }
    
    var tipPercentage: Double { //Decimal version of tip percentage
        return calc.tipPercentage
    }
    
    init(calc: Calculator) {
        self.calc = calc
    }
}
