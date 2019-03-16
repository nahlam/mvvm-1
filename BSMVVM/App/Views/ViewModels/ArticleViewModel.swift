//
//  ArticleViewModel.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class ArticleViewModel: BaseViewModel {

    private let article: Article
    
    init(article: Article) {
        self.article = article
        super.init()
    }
    
}
