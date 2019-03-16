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
    let column: String?
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
    let desFacet: [String]?
    let orgFacet: [String]?
    let perFacet: [String]?
    let geoFacet: String?
    let media: [Media]?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case adxKeywords = "adx_keywords"
        case column
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
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case uri
    }
}

struct Media: Decodable {
    
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Decodable {
    
    let url: String
    let format: String
    let height: Int
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case format
        case height
        case width
    }
}