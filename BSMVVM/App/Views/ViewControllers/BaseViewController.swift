//
//  BaseViewController.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewController<VM: BaseViewModel>: UIViewController {
    
    let disposeBag = DisposeBag()
    var viewModel: VM! {
        didSet {
            viewModel.message.asSignal().emit(onNext: { message in
                SwiftMessagesFacade.showMessage(body: message, theme: .error, presentationStyle: .top)
            }).disposed(by: disposeBag)
        }
    }
}
