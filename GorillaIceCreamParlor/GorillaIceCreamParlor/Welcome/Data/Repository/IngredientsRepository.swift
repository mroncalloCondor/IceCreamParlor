//
//  IngredientsRepository.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

final class IngredientsRepository: IngredientsRepositoryType {
    private let apiClient: ClientType
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func getIngredients() -> Single<[Ingredient]> {
        let request = IngredientsRequest()
        return apiClient.performOperation(request: request).map({
            (data: [APIIngredient]) in
            return IngredientsWrapper.map(data)
            
        })
    }
}
