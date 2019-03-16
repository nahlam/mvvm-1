//
//  SwinjectStoryboardAssemblies.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

// Swinject assembly for Storyboards
struct SwinjectStoryboardAssemblies: Assembly {
    
    func assemble(container: Container) {
        container.register(SwinjectStoryboard.self) { _ in
            return SwinjectStoryboard.create(name: R.storyboard.main.name, bundle: nil)
            }.inObjectScope(.container)  // singleton in container
    }
}
