//
//  ApiAssemblies.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Swinject
import Moya

// Swinject assembly for APIs
struct ApiAssemblies: Assembly {
    
    func assemble(container: Container) {
        container.register(MoyaProvider<ArticlesAPI>.self) { _ in
            var plugins: [PluginType] = [NetworkLoggerPlugin()]
            plugins.append(NetworkLoggerPlugin(verbose: true, cURL: false, responseDataFormatter: moyaJSONResponseDataFormatter))
            return MoyaProvider<ArticlesAPI> (plugins: plugins)
            }.inObjectScope(.container) // Single instance in the container (singleton)
    }
}
