//
//  ViewControllersAssemblies.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Swinject

// Swinject assembly for ViewControllers
struct ViewControllersAssemblies: Assembly {
    
    func assemble(container: Container) {
        container.storyboardInitCompleted(ArticlesViewController.self) { (resolver, controller) in
            controller.viewModel = resolver.resolve(ArticlesViewModel.self)
        }
    }
}
