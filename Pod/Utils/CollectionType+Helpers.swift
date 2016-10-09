//
//  CollectionType+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/11/16.
//
//

import Foundation

extension Collection {
    
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
    
    /** Transform items */
    public func each(`do`: (Self.Iterator.Element) -> Void) {
        for item in self {
            `do`(item)
        }
    }
    
