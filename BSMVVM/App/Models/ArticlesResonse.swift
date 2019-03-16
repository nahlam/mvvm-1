//
//  ArticlesResonse.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

struct ArticlesResonse: Decodable {

    let articles: [Article]
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case articles = "results"
        case count = "num_results"
    }
}
