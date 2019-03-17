//
//  ArticleChooser.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

protocol RxAlertActionType {
    associatedtype Result
    
    var title: String? { get }
    var style: UIAlertAction.Style { get }
    var result: Result { get }
}

struct RxAlertAction<R>: RxAlertActionType {
    typealias Result = R
    
    let title: String?
    let style: UIAlertAction.Style
    let result: R
}

struct RxDefaultAlertAction: RxAlertActionType {
    typealias Result = RxAlertControllerResult
    
    let title: String?
    let style: UIAlertAction.Style
    let result: Result
}

enum RxAlertControllerResult {
    case latest
    case lastWeek
    case lastMonth
    case cancel
    case okay
}

extension UIAlertController {
    // swiftlint:disable line_length
    static func rx_presentAlert<Action: RxAlertActionType, Result>(viewController: UIViewController, title: String, message: String, preferredStyle: UIAlertController.Style = .alert, animated: Bool = true, actions: [Action]) -> Observable<Result> where Action.Result == Result {
        return Observable.create { observer -> Disposable in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
            
            actions.map { rxAction in
                UIAlertAction(title: rxAction.title, style: rxAction.style, handler: { _ in
                    observer.onNext(rxAction.result)
                    observer.onCompleted()
                })
                }
                .forEach(alertController.addAction)
            viewController.present(alertController, animated: animated, completion: {
                alertController.view.tintColor = UIColor.appColor
            })
            return Disposables.create {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    // swiftlint:enable line_length
}

extension RxAlertControllerResult {
    
    func getPeriod() -> Period? {
        switch self {
        case .latest:
            return .latest
        case .lastWeek:
            return .lastWeek
        case .lastMonth:
            return .lastMonth
        default:
            return nil
        }
    }
}
