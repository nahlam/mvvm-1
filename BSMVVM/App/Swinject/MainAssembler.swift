//
//  MainAssembler.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit

import Foundation
import Swinject
import SwinjectStoryboard

// Wrapper class that composes Swinject assembler. The assembler uses the default SwinjectStoryboard container.
class MainAssembler {
    
    private let assembler = Assembler(container: SwinjectStoryboard.defaultContainer)
    
    var resolver: Resolver {
        return assembler.resolver
    }
    
    init() {
        Container.loggingFunction = nil  // disable false positive logs

        // applying Api assemblies
        assembler.apply(assembly: ApiAssemblies())
        
        // applying repositores assemblies
        assembler.apply(assembly: RepositoriesAssemblies())
    }
}
