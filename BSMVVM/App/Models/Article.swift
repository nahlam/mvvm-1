//
//  Article.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

struct Article: Decodable {
    
    let url: String
    let adxKeywords: String
    let section: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let publishedDate: String
    let source: String
    let id: Int
    let assetId: Int
    let views: Int
    let media: [Media]?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case adxKeywords = "adx_keywords"
        case section
        case byline
        case type
        case title
        case abstract
        case publishedDate = "published_date"
        case source
        case id
        case assetId = "asset_id"
        case views
        case media
        case uri
    }
}

struct Media: Decodable {
    
    let type: String
    let subtype: String?
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadata]?
    
    enum CodingKeys: String, CodingKey {
        
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

enum MediaFormat: String, Codable {
    case standardThumbnail = "Standard Thumbnail"
    case medium = "mediumThreeByTwo210"
    case mediumBig = "mediumThreeByTwo440"
    
    enum CodingKeys: String, CodingKey {
        case standardThumbnail
        case medium
        case mediumBig
    }
}

struct MediaMetadata: Decodable {
    
    let url: String
    let format: MediaFormat
    let height: Int
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case format
        case height
        case width
    }
}
