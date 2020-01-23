//
//  Ingredient.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation

struct APIIngredient: Codable {
    var name1: String
    var name2: String
    var price: String
    var color: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case name1, name2, price, type
        case color = "bg_color"
    }
}


