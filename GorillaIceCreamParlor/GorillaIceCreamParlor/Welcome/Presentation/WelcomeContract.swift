//
//  WelcomeContract.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation

protocol WelcomeViewPresenterType {
    func didFinishLoadingView()
    func getIngredientsCount() -> Int
    func getIngredient(for index: Int) -> Ingredient
    func ingredientSelected(at index: Int)
    func getOrderItemsCount() -> Int
}

protocol WelcomeViewControllerType: PresenterViewType {
    func setLoading()
    func finishLoading()
}
