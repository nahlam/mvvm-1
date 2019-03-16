//
//  BaseViewModel.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    
    let disposeBag = DisposeBag()
    
    // used for messages like error or something
    let message = PublishRelay<(String)>()
    
}
