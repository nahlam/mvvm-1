//
//  Observable+MoyaErrorhandler.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import RxSwift
import Moya

extension ObservableType {
    
    func subscribWithErrorHandling(onSuccess: @escaping ((Self.E) -> Void), onError: ((Error) -> Void)? = nil, viewModel: BaseViewModel) -> Disposable {
        
        return self.subscribe(onNext: { element in
            onSuccess(element)
        }, onError: { error in
            let errorMessage: String!
            errorMessage = error.localizedDescription
            viewModel.message.accept(errorMessage)
            onError?(error)
        })
    }
}
