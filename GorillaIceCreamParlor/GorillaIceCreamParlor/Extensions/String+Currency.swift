//
//  String+Currency.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
extension String {
    func getValue() -> Double {
        let formatter = NumberFormatter()
        
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.decimalSeparator = "."
        
        return formatter.number(from: self) as? Double ?? 0
    }
}
