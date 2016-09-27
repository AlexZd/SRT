//
//  AlertRepresentable.swift
//  Pods
//
//  Created by Alex Zdorovets on 9/27/16.
//
//

import Foundation

public protocol AlertRepresentable {
    func showError(error:NSError)
    func showError(title:String, error:NSError)
    func showAlert(title:String, text:String?)
}

extension AlertRepresentable where Self: UIViewController {
    
    public func showError(error:NSError) {
        self.showError("Error", error: error)
    }
    
    public func showError(title:String, error:NSError) {
        let CRUDResponseDataKey = "CRUDResponseDataKey"
        if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? [String] where errorsInfo.isEmpty == false {
            self.showAlert(title, text: errorsInfo.first)
        } else if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? [String: String] where errorsInfo.isEmpty == false {
            self.showAlert(title, text: errorsInfo["error"])
        } else {
            self.showAlert(title, text: error.localizedDescription)
        }
    }
    
    public func showAlert(title:String, text:String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: "").up, style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController : AlertRepresentable {
    /** In case you need to change alert, just override methods in extension inside your project */
}