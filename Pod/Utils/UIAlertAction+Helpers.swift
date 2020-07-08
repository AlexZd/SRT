//
//  UIAlertAction+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 11/14/16.
//
//

import Foundation
import UIKit

public typealias UIAlertActionHandler = (UIAlertAction) -> Swift.Void

private var handlerAssociationKey: UInt8 = 0
extension UIAlertAction {
    private var omg: [String: UIAlertActionHandler] {
        get { return objc_getAssociatedObject(self, &handlerAssociationKey) as? [String: UIAlertActionHandler] ?? [:] }
        set { objc_setAssociatedObject(self, &handlerAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    /** Action's handler */
    public var actionHandler: UIAlertActionHandler? {
        return self.omg["closure"]
    }
    
    /** Creates and returns an action with the specified title and behavior, helping to store handler */
    public convenience init(title: String?, style: UIAlertAction.Style = .default, closure: UIAlertActionHandler? = nil) {
        self.init(title: title, style: style, handler: closure)
        if let closure = closure {
            self.omg["closure"] = closure
        }
    }
    
}
