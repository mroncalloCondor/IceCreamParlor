//
//  IngredientsRepositoryType.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

protocol IngredientsRepositoryType: AnyObject {
    func getIngredients() -> Single<[Ingredient]>
}
