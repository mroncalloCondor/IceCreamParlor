//
//  Ingredient.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import UIKit

struct Ingredient: Hashable {
    var name1: String
    var name2: String
    var price: String
    var color: UIColor
    var type: IngredientType
}

enum IngredientType: String {
    case popsicle
    case froyo
    case cone
    case sundae
    case none
}
