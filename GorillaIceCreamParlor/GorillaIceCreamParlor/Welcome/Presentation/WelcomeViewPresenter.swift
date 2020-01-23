//
//  WelcomeViewPresenter.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

final class WelcomePresenter: BasePresenter {
    
    let disposeBag = DisposeBag()
    var ingredients = [Ingredient]()
    var order = [Ingredient: Int]()
    weak var getIngredientsInteractor: SingleInteractor<[Ingredient], Any>?
    
    private var ownView: WelcomeViewControllerType {
        return self.view as! WelcomeViewControllerType
    }
    init(with view: WelcomeViewControllerType,
                  getIngredientsInteractor: SingleInteractor<[Ingredient], Any>) {
        self.getIngredientsInteractor = getIngredientsInteractor
        super.init(with: view)
    }
    
    private func removeFromOrder(ingredient: Ingredient) {
        self.order[ingredient] = nil
    }
    
    private func addToOrder(ingredient: Ingredient) {
        guard let amount = order[ingredient] else {
            order[ingredient] = 1
            return
        }
        order[ingredient] = amount + 1
    }
}

extension WelcomePresenter: WelcomeViewPresenterType {
    func didFinishLoadingView() {
        ownView.setLoading()
        self.getIngredientsInteractor?.buildUseCase(params: nil)
            .subscribe(onSuccess: { [weak self, weak ownView] (ingredients) in
                self?.ingredients = ingredients
                ownView?.finishLoading()
            print(ingredients)
        }, onError: { [weak ownView](error) in
            print(error)
            ownView?.finishLoading()
        }).disposed(by: disposeBag)
    }
    
    func getIngredientsCount() -> Int {
        return ingredients.count
    }
    
    func getIngredient(for index: Int) -> Ingredient {
        return ingredients[index]
    }
    
    func ingredientSelected(at index: Int) {
        let ingredientSelected = ingredients[index]
        
        if let orderAmount = order[ingredientSelected] {
            if orderAmount == 2 {
                removeFromOrder(ingredient: ingredientSelected)
            } else {
                addToOrder(ingredient: ingredientSelected)
            }
        } else {
            addToOrder(ingredient: ingredientSelected)
        }
    }
    
    func getOrderItemsCount() -> Int {
        var totalItems = 0
        for (_, amount) in order {
            totalItems += amount
        }
        return totalItems
    }
}
