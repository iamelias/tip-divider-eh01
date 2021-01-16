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
        return "\(calc.numberOfPeople)"
    }
    
    var tipPerPerson: String {
        return "$" + String(format: "%.2f", calc.tipPerPerson) //creating $0.00 format
    }
    
    var tipPercentage: String {
        return "%"
    }
    
    
    init(calc: Calculator) {
        self.calc = calc
    }
}
