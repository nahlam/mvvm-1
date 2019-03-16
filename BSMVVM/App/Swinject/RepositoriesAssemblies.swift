//
//  RepositoriesAssemblies.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Swinject
import Moya

class RepositoriesAssemblies: Assembly {
    
    func assemble(container: Container) {
        container.register(ArticlesRepository.self) { resolver in
            return ArticlesRepository(api: resolver.resolve(MoyaProvider<ArticlesAPI>.self)!)
        }
    }
}
