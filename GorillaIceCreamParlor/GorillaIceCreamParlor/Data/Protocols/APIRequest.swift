//
//  APIRequest.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation

protocol APIRequest {
    var method: RequestType {get}
    var path: String {get}
    var parameters: [String: Any]? {get}
}

enum RequestType: String{
    case get
}
