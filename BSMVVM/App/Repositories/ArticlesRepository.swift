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

// Using repository so if we need to save something local or get data from other source

struct ArticlesRepository {
    
    let api: MoyaProvider<ArticlesAPI>
    
    func getArticles(period: Period = .lastDay) -> Single<ArticlesResonse> {
        return api.rx.request(.getArticles(period: period))
            .map(ArticlesResonse.self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: false)
    }
    
    func getArticlesFromJSONFile(_ fileName: String = "Response") -> Single<ArticlesResonse> {
        return Single.create { single in
            do {
                let result = try ArticlesResonse.fromJSON(fileName) as ArticlesResonse
                single(.success(result))
            } catch {
                single(.error(error))
            }
            return Disposables.create()
        }
        
    }
}

extension Decodable {
    
    static func fromJSON<T: Decodable>(_ fileName: String, fileExtension: String = "json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
