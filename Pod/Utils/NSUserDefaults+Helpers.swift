//
//  NSUserDefaults+Helpers.swift
//
//  Created by Alex Zdorovets on 5/18/16.
//
//

import Foundation

extension UserDefaults {
    
    //MARK: - Class
    
    public class func get(key:String) -> Any? {
        return UserDefaults.standard.get(key: key)
    }
    
    public class func set(value:Any?, key:String, synchronize:Bool = true) {
        UserDefaults.standard.set(value: value, key: key, synchronize: synchronize)
    }
    
    //MARK: - Instance
    
    public func get(key:String) -> Any? {
        return UserDefaults.standard.value(forKey: key)
    }
    
    public func set(value: Any?, key: String, synchronize: Bool = true) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()
        }
    }
    
}
