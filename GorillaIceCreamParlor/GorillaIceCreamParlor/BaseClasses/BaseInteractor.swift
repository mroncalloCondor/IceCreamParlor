//
//  BaseInteractor.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

public protocol Interactor: AnyObject {
    func execute()
}

open class BaseInteractor<Response, Parameters> {
    
    var disposable: Disposable?
    
    var paramsAttribute: Parameters?
    
    var onNextCallback: ((Response) -> Void)?
    
    var onCompletedCallback: (() -> Void)?
    
    var onErrorCallback: ((Error) -> Void)?
    
    var onFinallyCallback: (() -> Void)?
    
    deinit {
        disposable?.dispose()
    }
}

open class BaseInteractorAdapter<Response, Parameters, ChainType>: Interactor {
    
    let baseInteractor = BaseInteractor<Response, Parameters>()
    
    public init() {
    }
    
    @discardableResult
    public func params(_ paramsAttribute: Parameters?) -> ChainType {
        self.baseInteractor.paramsAttribute = paramsAttribute
        return self as! ChainType
    }
    
    @discardableResult
    public func onFinally(_ onFinallyCallback: (() -> Void)?) -> ChainType {
        self.baseInteractor.onFinallyCallback = onFinallyCallback
        return self as! ChainType
    }
    
    @discardableResult
    public func onError(_ onErrorCallback: ((Error) -> Void)?) -> ChainType {
        self.baseInteractor.onErrorCallback = onErrorCallback
        return self as! ChainType
    }
    
    public func execute() {
    }
}
