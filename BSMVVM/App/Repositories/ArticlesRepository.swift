//
//  ArticlesRepository.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//
import Foundation
import Moya
import RxSwift
import RxCocoa

struct ArticlesRepository {
    
    let api: MoyaProvider<ArticlesAPI>
    
    func getArticles(period: Period) -> Single<ArticlesResonse> {
        return api.rx.request(.getArticles(period: period))
            .map(ArticlesResonse.self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: false)
    }
}
