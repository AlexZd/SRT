//
//  AlertRepresentable.swift
//  Pods
//
//  Created by Alex Zdorovets on 9/27/16.
//
//

import Foundation

public protocol AlertRepresentable {
    func present(error:NSError)
    func present(title:String, error:NSError)
    func present(title:String, text:String?)
}

extension AlertRepresentable where Self: UIViewController {
    
    public func present(error:NSError) {
        self.present(title: "Error", error: error)
    }
    
    public func present(title:String, error:NSError) {
        let CRUDResponseDataKey = "CRUDResponseDataKey"
        if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? [String] , errorsInfo.isEmpty == false {
            self.present(title: title, text: errorsInfo.first)
        } else if let errorsInfo = error.userInfo[CRUDResponseDataKey] as? [String: String] , errorsInfo.isEmpty == false {
            self.present(title: title, text: errorsInfo["error"])
        } else {
            self.present(title: title, text: error.localizedDescription)
        }
    }
    
    public func present(title:String, text:String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: "").up, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController : AlertRepresentable {
    /** In case you need to change alert, just override methods in extension inside your project */
}
