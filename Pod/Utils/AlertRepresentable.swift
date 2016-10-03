//
//  AlertRepresentable.swift
//  Pods
//
//  Created by Alex Zdorovets on 9/27/16.
//
//

import Foundation

public protocol AlertRepresentable {
    func show(error:Error)
    func show(title:String, error:Error)
    func show(title:String, text:String?)
}

extension AlertRepresentable where Self: UIViewController {
    
    public func show(error:Error) {
        self.present(title: "Error", error: error)
    }
    
    public func show(title:String, error:Error) {
        self.present(title: title, text: error.localizedDescription)
    }
    
    public func show(title:String, text:String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("ok", comment: "").up, style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController : AlertRepresentable {
    /** In case you need to change alert, just override methods in extension inside your project */
}
