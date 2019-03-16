//
//  ViewModelsAssemblies.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Swinject
import Moya

// Swinject assembly for ViewModels
struct ViewModelsAssemblies: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ArticlesViewModel.self) { resolver in
            return ArticlesViewModel(repository: resolver.resolve(ArticlesRepository.self)!)
        }
    }
}
