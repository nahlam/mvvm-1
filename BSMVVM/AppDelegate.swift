//
//  AppDelegate.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let disposeBag = DisposeBag()
    var window: UIWindow?
    static let mainAssembler = MainAssembler()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        getArticles()
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    private func getArticles() {
        
        AppDelegate.mainAssembler.resolver.resolve(ArticlesRepository.self)?.getArticles(period: .lastDay).asObservable().subscribe(onNext: { (articlesResponse) in
            print(articlesResponse)
        }).disposed(by: disposeBag)
    }
}
