//
//  NSUserDefaults+Helpers.swift
//
//  Created by Alex Zdorovets on 5/18/16.
//
//

import Foundation

extension UserDefaults {
    
    //MARK: - Class
    
    public class func get<T>(key:String) -> T? {
        return UserDefaults.standard.get(key: key)
    }
    
    public class func set(value:Any?, key:String, synchronize:Bool = true) {
        UserDefaults.standard.set(value: value, key: key, synchronize: synchronize)
    }
    
    //MARK: - Instance
    
    public func get<T>(key:String) -> T? {
        return UserDefaults.standard.value(forKey: key) as? T
    }
    
    public func set(value: Any?, key: String, synchronize: Bool = true) {
        self.setValue(value, forKey: key)
        if synchronize {
            self.synchronize()
        }
    }
    
}
