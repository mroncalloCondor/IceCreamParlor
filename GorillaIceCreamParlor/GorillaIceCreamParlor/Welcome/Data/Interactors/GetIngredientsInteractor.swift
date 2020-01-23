//
//  GetIngredientsInteractor.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

final class GetIngredientsInteractor: SingleInteractor<[Ingredient], Any> {
    var ingredientsRepository: IngredientsRepositoryType?
    
    public init(ingredientsRepository: IngredientsRepositoryType){
        self.ingredientsRepository = ingredientsRepository
    }
    
    override func buildUseCase(params: Any? = nil) -> Single<[Ingredient]> {
        return self.ingredientsRepository!.getIngredients()
    }
}
