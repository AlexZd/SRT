//
//  NSUserDefaults+Helpers.swift
//
//  Created by Alex Zdorovets on 5/18/16.
//
//

import Foundation

extension NSUserDefaults {
    
    //MARK: - Class
    
    public class func get<T>(key:String) -> T? {
        return NSUserDefaults.standardUserDefaults().get(key)
    }
    
    public class func set(value:AnyObject?, key:String, synchronize:Bool = true) {
        NSUserDefaults.standardUserDefaults().set(value, key: key, synchronize: synchronize)
    }
    
    //MARK: - Instance
    
    public func get<T>(key:String) -> T? {
        return NSUserDefaults.standardUserDefaults().valueForKey(key) as? T
    }
    
    public func set(value: AnyObject?, key: String, synchronize: Bool = true) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()
        }
    }
    
}