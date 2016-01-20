//
//  UIViewController+Error.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showError(error:NSError) {
        self.showError("Error", error: error)
    }
    
    public func showError(title:String, error:NSError) {
        UIAlertView(title: title as String, message: error.localizedDescription, delegate: self, cancelButtonTitle: "Ok").show()
    }
}