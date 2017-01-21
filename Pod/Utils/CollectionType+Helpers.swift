//
//  CollectionType+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/11/16.
//
//

import Foundation

extension Collection {
    
    public var json : Data {
        return try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
    }
    
    /** Get first non-empty object */
    public var firstNonEmpty: Self.Iterator.Element? {
        for object in self {
            if (object as? AnyObject)?.isKind(of: NSNull.self) == false && (object as? String)?.isEmpty != true {
                return object
            }
        }
        return nil
    }
    
    /** Get last non-empty object */
    public var lastNonEmpty: Self.Iterator.Element? {
        for object in self.reversed() {
            if (object as? AnyObject)?.isKind(of: NSNull.self) == false && (object as? String)?.isEmpty != true {
                return object
            }
        }
        return nil
    }
    
}
