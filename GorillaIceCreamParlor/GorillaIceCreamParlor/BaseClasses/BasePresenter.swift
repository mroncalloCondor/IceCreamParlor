//
//  BasePresenter.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation

class BasePresenter {
    weak var view: PresenterViewType?
    init(with view: PresenterViewType) {
        self.view = view
    }
}
