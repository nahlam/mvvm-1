//
//  Single+MoyaErrorHandler.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import RxSwift
import Moya

extension PrimitiveSequenceType where Self.TraitType == RxSwift.SingleTrait {
    
    typealias SuccessClosure = ((Self.ElementType) -> Void)
    typealias ErrorClosure = ((Error) -> Void)?
    
    func subscribWithErrorHandling(onSuccess: @escaping SuccessClosure, onError: ErrorClosure = nil, viewModel: BaseViewModel) -> Disposable {
        return self.subscribe(onSuccess: { element in
            onSuccess(element)
        }, onError: { error in
            let errorMessage: String!
            errorMessage = error.localizedDescription
            viewModel.message.accept(errorMessage)
            onError?(error)
        })
    }
}
