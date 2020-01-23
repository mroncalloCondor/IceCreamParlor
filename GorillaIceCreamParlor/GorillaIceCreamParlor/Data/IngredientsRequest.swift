
//
//  IngredientsRequest.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation

struct IngredientsRequest: APIRequest {
    var method = RequestType.get
    var path = "/products"
    var parameters: [String : Any]? = nil
}
