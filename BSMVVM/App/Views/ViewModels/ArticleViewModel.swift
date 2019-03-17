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

    let article: Article
    
    init(article: Article) {
        self.article = article
        super.init()
    }
    
    func getThumbnailURLString() -> String? {
        guard let metaDataArray = article.media?[0].mediaMetadata else { return nil }
        for mediaMetaData in metaDataArray where mediaMetaData.format == .standardThumbnail {
            return mediaMetaData.url
        }
        return nil
    }
    
    func getLargeImageURLString() -> String? {
        guard let metaDataArray = article.media?[0].mediaMetadata else { return nil }
        for mediaMetaData in metaDataArray where mediaMetaData.format == .big {
            return mediaMetaData.url
        }
        return nil
    }
}
