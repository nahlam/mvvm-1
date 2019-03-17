//
//  ArticlesAPI.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Moya

// Add period as enumration for non magic keys
enum Period: Int {
    case latest = 1
    case lastWeek = 7
    case lastMonth = 30
}

// Moya Articles API
enum ArticlesAPI {
    case getArticles(period: Period)
}

extension ArticlesAPI: TargetType {
    fileprivate static let APIKey = "hCQ9RN2UsenROQ0TLBe6Lf93UAATi3Ol"
    
    var baseURL: URL {
        return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/")!
    }
    
    var path: String {
        switch self {
        case .getArticles(let period):
            return "\(period.rawValue).json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getArticles:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .getArticles:
            var requestParameters: [String: AnyObject] = [String: AnyObject]()
            requestParameters["api-key"] = ArticlesAPI.APIKey as AnyObject
            return.requestParameters(parameters: requestParameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
