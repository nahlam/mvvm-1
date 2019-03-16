//
//  KingFisherFacade.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import Kingfisher

final class KingFisherFacade {

    static let shared = KingFisherFacade()
    
    private init() {}
    
    func setImageView(_ imageView: UIImageView, withURLString urlString: String?) {
        if urlString == nil {
            return
        }
        let url = URL(string: urlString ?? "")
        imageView.kf.setImage(with: url)
    }
    
}
