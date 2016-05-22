//
//  String+Helpers.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension String {
    
    /** Returns first char */
    var first: String { return String(self.characters.prefix(1)) }
    
    /** Returns last char */
    var last: String { return String(self.characters.suffix(1)) }
    
    /** Returns localizedUppercaseString for iOS 9+ or uppercaseString for below */
    public var up: String {
        if #available(iOS 9, *) {
            return self.localizedUppercaseString
        }
        return self.uppercaseString
    }
    
    /** Returns localizedLowercaseString for iOS 9+ or lowercaseString for below */
    public var down: String {
        if #available(iOS 9, *) {
            return self.localizedLowercaseString
        }
        return self.lowercaseString
    }
    
    /** Returns localizedCapitalizedString for iOS 9+ or capitalizedString for below */
    public var cap: String {
        if #available(iOS 9, *) {
            return self.localizedCapitalizedString
        }
        return self.capitalizedString
    }
    
    /** Returns string with first capitalized letter */
    public var capFirst: String {
        return self.first.up + String(self.characters.dropFirst())
    }
    
    /** Converts String to Gregorian NSDate */
    public func stringToDate(mask:String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = mask
        return dateFormatter.dateFromString(self)
    }
    
    /** Returns truncated string with ending which you spicify in trailing */
    public func trunc(length: Int, trailing: String? = "...") -> String {
        if self.characters.count > length {
            return self.substringToIndex(self.startIndex.advancedBy(length)) + (trailing ?? "")
        } else {
            return self
        }
    }
}