//
//  SingleInteractor.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import Foundation
import RxSwift

open class SingleInteractor<Response, Parameters>: BaseInteractorAdapter<Response, Parameters, SingleInteractor> {
    
    public override init() {
    }
    
    override public func execute() {
        self.baseInteractor.disposable = buildUseCase(params: self.baseInteractor.paramsAttribute)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .userInitiated))
            .subscribe(
                onSuccess: { [weak self] (response) in
                    self?.baseInteractor.onNextCallback?(response)
                    self?.baseInteractor.onFinallyCallback?()
                },
                onError: { [weak self] (error) in
                    self?.baseInteractor.onErrorCallback?(error)
                    self?.baseInteractor.onFinallyCallback?()
            })
    }
    
    open func buildUseCase(params: Parameters?) -> Single<Response> {
        return Single.create(subscribe: { _ -> Disposable in
            return Disposables.create()
        })
    }
    
    @discardableResult
    public func onSuccess(_ onSuccessCallback: ((Response) -> Void)?) -> Self {
        self.baseInteractor.onNextCallback = onSuccessCallback
        return self
    }
}

