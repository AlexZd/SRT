//
//  UIViewController+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func fixIOS9PopOverAnchor(segue:UIStoryboardSegue?) {
        guard #available(iOS 9.0, *) else {
            return
        }
        if let popOver = segue?.destination.popoverPresentationController, let anchor  = popOver.sourceView, popOver.sourceRect == CGRect() && segue!.source === self {
            popOver.sourceRect = anchor.bounds
        }
    }
}
