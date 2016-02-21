//
//  UIViewController+Helpers.swift
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
    
    public func fixIOS9PopOverAnchor(segue:UIStoryboardSegue?) {
        guard #available(iOS 9.0, *) else {
            return
        }
        if let popOver = segue?.destinationViewController.popoverPresentationController, let anchor  = popOver.sourceView where popOver.sourceRect == CGRect() && segue!.sourceViewController === self {
            popOver.sourceRect = anchor.bounds
        }
    }
}