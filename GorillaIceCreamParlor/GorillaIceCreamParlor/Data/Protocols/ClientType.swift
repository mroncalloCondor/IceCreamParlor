//
//  ClientType.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

protocol ClientType: AnyObject {
    func performOperation<T: Codable> (request: APIRequest) -> Single<T>
}
