//
//  CollectionType+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/11/16.
//
//

import Foundation

extension CollectionType {
    
    /** Get first non-empty object */
    public var firstNonEmpty: Self.Generator.Element? {
        for object in self {
            if (object as? AnyObject)?.isKindOfClass(NSNull) == false && (object as? String)?.isEmpty != true {
                return object
            }
        }
        return nil
    }
    
    /** Get last non-empty object */
    public var lastNonEmpty: Self.Generator.Element? {
        for object in self.reverse() {
            if (object as? AnyObject)?.isKindOfClass(NSNull) == false && (object as? String)?.isEmpty != true {
                return object
            }
        }
        return nil
    }
    
    /** Transform items */
    public func doMap(transform: (Self.Generator.Element) -> Void) {
        for item in self {
            transform(item)
        }
    }
    
}