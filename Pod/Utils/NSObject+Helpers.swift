//
//  NSObject+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSObject {
    /** Returns class description. Useful for identifiers.  */
    public class var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    /** Do something after delay */
    public func delay(_ delay: Double, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
}
