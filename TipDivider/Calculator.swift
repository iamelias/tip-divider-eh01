//
//  Calculator.swift
//  TipDivider
//
//  Created by Elias Hall on 1/10/21.
//

import Foundation
import UIKit

class Calculator {
    var totalAmount: Double 
    var numberOfPeople: Double
    var tipPerPerson: Double {
        return totalAmount/numberOfPeople
    }
    
    init(totalAmount: Double, numberOfPeople: Double) {
        self.totalAmount = totalAmount
        self.numberOfPeople = numberOfPeople
    }
}
