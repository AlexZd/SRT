//
//  UIViewController+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showError(error:NSError) {
        self.showError(title: "Error", error: error)
    }
    
    public func showError(title:String, error:NSError) {
        let CRUDResponseDataKey = "CRUDResponseDataKey"
        if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? Array<String>, errorsInfo.isEmpty == false {
            self.showAlert(title: title, text: errorsInfo.first)
        } else if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? Dictionary<String,String>,  errorsInfo.isEmpty == false {
            self.showAlert(title: title, text: errorsInfo["error"])
        } else {
            self.showAlert(title: title, text: error.localizedDescription)
        }
    }
    
    public func showAlert(title:String, text:String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: "").uppercased(), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    public func fixIOS9PopOverAnchor(segue:UIStoryboardSegue?) {
        guard #available(iOS 9.0, *) else {
            return
        }
        if let popOver = segue?.destination.popoverPresentationController, let anchor  = popOver.sourceView, popOver.sourceRect == CGRect() && segue!.source === self {
            popOver.sourceRect = anchor.bounds
        }
    }
}
