//
//  NSUserDefaults+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 5/18/16.
//
//

import Foundation

extension NSUserDefaults {
    
    public func setValue(value: AnyObject?, forKey key: String, synchronize: Bool) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()
        }
    }
    
}