//
//  String+Helpers.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension String {
    
    public var firstChar : String {
        get {
            return String(self.characters.first!)
        }
    }
    
    public var capitalizedFirstString : String {
        get {
            return self.firstChar.uppercaseString + String(self.characters.dropFirst())
        }
    }
    
    public var up: String {
        if #available(iOS 9, *) {
            return self.localizedUppercaseString
        }
        return self.uppercaseString
    }
    
    public var down: String {
        if #available(iOS 9, *) {
            return self.localizedLowercaseString
        }
        return self.lowercaseString
    }
    
    /** Converts String to Gregorian NSDate */
    public func stringToDate(mask:String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = mask
        return dateFormatter.dateFromString(self)
    }
    
    public func trunc(length: Int, trailing: String? = "...") -> String {
        if self.characters.count > length {
            return self.substringToIndex(self.startIndex.advancedBy(length)) + (trailing ?? "")
        } else {
            return self
        }
    }
}