//
//  NSDate+Helpers.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSDate {
    public var dateOnly : NSDate {
        get {
            return self.dateToString("dd.MM.yyyy").stringToDate("dd.MM.yyyy")!
        }
    }
    
    public var isToday : Bool {
        get {
            return self.dateOnly == NSDate().dateOnly
        }
    }
    
    public var isYesterday : Bool{
        get {
            return self.dateOnly == NSDate().dateByAddingTimeInterval(-1 * 60 * 60 * 24).dateOnly
        }
    }
    
    public func dateWithShift(days:Int, months:Int, years:Int) -> NSDate {
        let cal = NSCalendar.currentCalendar()
        let components = cal.components([.Year, .Month, .Day], fromDate: NSDate())
        components.year = components.year + years
        components.month = components.month + months
        components.day = components.day + days
        return cal.dateFromComponents(components)!
    }
    
    /** Converts NSDate to String with mask format */
    public func dateToString(mask:String?) -> String {
        let dateFormatter = NSDateFormatter()
        if mask != nil {
            dateFormatter.dateFormat = mask
        }else{
            dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        }
        
        return dateFormatter.stringFromDate(self)
    }

    /** Converts NSDate to String with mask format in Gregorian format */
    public func dateToGregorianString(mask:String?) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        if mask != nil {
            dateFormatter.dateFormat = mask
        }else{
            dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
            dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        }
        
        return dateFormatter.stringFromDate(self)
    }
    
    public func dateTimeToFormatter(dateF:NSDateFormatterStyle, timeF:NSDateFormatterStyle) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = timeF
        dateFormatter.dateStyle = dateF
        
        return dateFormatter.stringFromDate(self)
    }
    
    public func dateToFormatter(formatter:NSDateFormatterStyle) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = formatter
        
        return dateFormatter.stringFromDate(self)
    }
    
    public func timeToFormatter(formatter:NSDateFormatterStyle) -> String{
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = formatter
        
        return dateFormatter.stringFromDate(self)
    }
}