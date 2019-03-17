//
//  ProgressOverlay.swift
//  BSMVVM
//
//  Created by Nahla Mortada on 3/17/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import UIKit
import MRProgress

class ProgressOverlay {
    
    fileprivate var progressView: MRProgressOverlayView?
    
    public static let sharedInstance: ProgressOverlay = {
        let instance = ProgressOverlay()
        return instance
    }()
    
    /// Method for showing "Indeterminate" progress indicator with title message
    public func showProgressIndecator(title: String = "") {
        DispatchQueue.main.async {
            self.progressView = MRProgressOverlayView()
            self.progressView?.titleLabelText = title
            self.progressView?.mode = MRProgressOverlayViewMode.indeterminate
            if self.progressView != nil {
                UIApplication.shared.keyWindow!.addSubview(self.progressView!)
            }
            self.progressView?.tintColor = UIColor.appColor
            self.progressView?.show(true)
        }
    }
    
    /// Method to just hide the progress indicator not for deleting it
    public func hideProgressIndicator() {
        DispatchQueue.main.async {
            self.progressView?.mode = MRProgressOverlayViewMode.checkmark
            self.progressView?.hide(true)
        }
        
    }
}
