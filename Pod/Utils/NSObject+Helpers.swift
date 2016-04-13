//
//  NSObject+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSObject {
    /** Returns class description. Useful for identifiers.  */
    public class var identifier : String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    
    /** Do something after delay */
    public func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}