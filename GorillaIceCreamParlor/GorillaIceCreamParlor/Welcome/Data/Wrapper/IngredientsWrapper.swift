//
//  IngredientsWrapper.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import UIKit

final class IngredientsWrapper {
    static func map(_ apiIngredients: [APIIngredient]) -> [Ingredient]{
        var ingredientsList = [Ingredient]()
        for ingredient in apiIngredients {
            let ingredientData = Ingredient(
                name1: ingredient.name1,
                name2: ingredient.name2,
                price: ingredient.price,
                color: UIColor.from(hex: ingredient.color),
                type: IngredientType(rawValue: ingredient.type) ?? .none)
            ingredientsList.append(ingredientData)
        }
        return ingredientsList
    }
}
