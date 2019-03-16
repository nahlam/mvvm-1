//
//  ArticlesViewModel.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ArticlesViewModel: BaseViewModel {
    
    private let repository: ArticlesRepository
    
    let articles = BehaviorRelay<[Article]>(value: [])
    let count = BehaviorRelay<Int>(value: 0)
    let isLoading = PublishRelay<Bool>()
    
    init(repository: ArticlesRepository) {
        self.repository = repository
        super.init()
    }
    
    func getArticles() {
        repository.getArticlesFromJSONFile()
            .subscribWithErrorHandling(onSuccess: { [weak self] response in
                guard let self = self else {
                    return
                }
                self.articles.accept(response.articles)
                self.count.accept(response.count)
                self.isLoading.accept(false)
                }, onError: { [weak self] _ in
                    guard let self = self else {
                        return
                    }
                    self.isLoading.accept(false)
                }, viewModel: self).disposed(by: disposeBag)
    }
}
