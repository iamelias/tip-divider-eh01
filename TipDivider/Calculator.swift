//
//  Calculator.swift
//  TipDivider
//
//  Created by Elias Hall on 1/10/21.
//

import Foundation
import UIKit

class Calculator {
    var totalAmount: Double = 0.0
    var numberOfPeople: Double = 1.0
    var tipPerPerson: Double {
        return totalAmount/numberOfPeople
    }
}
