//
//  NSDate+Helpers.swift
//
//  Created by Alex Zdorovets on 6/17/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension Date {
    public var dateOnly: Date {
        if let date = self.toGregorianString(mask: "dd.MM.yyyy").toDate("dd.MM.yyyy") {
            return date
        }
        fatalError("Date is nil! \(#file) \(#line)")
    }
    
    public var timeOnly: Date {
        return self.toString("HH:mm").toDate("HH:mm")!
    }
    
    public static func time(_ time: Date, rounded: Int) -> Date {
        let nextDiff = rounded - Calendar.current.component(.minute, from: time) % rounded
        return Calendar.current.date(byAdding: .minute, value: nextDiff, to: time) ?? Date()
    }
    
    public func dateWithShift(days: Int, months: Int, years: Int) -> Date? {
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        var components = Calendar.current.dateComponents(unitFlags, from: self)
        components.year = (components.year ?? 0) + years
        components.month = (components.month ?? 0) + months
        components.day = (components.day ?? 0) + days
        return Calendar.current.date(from: components)
    }
    
    /** Converts NSDate to String with mask format */
    public func toString(_ mask: String?) -> String {
        let dateFormatter = DateFormatter()
        if mask != nil {
            dateFormatter.dateFormat = mask
        }else{
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
        }
        
        return dateFormatter.string(from: self)
    }

    /** Converts NSDate to String with mask format in Gregorian format */
    public func toGregorianString(mask: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        if mask != nil {
            dateFormatter.dateFormat = mask
        }else{
            dateFormatter.timeStyle = .medium
            dateFormatter.dateStyle = .medium
        }
        
        return dateFormatter.string(from: self)
    }
    
    public func dateTimeToFormatter(date: DateFormatter.Style, time: DateFormatter.Style) -> String {
        return DateFormatter(dateStyle: date, timeStyle: time).string(from: self)
    }
    
    public func dateTimeToGregorianFormatter(date: DateFormatter.Style, time: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter(dateStyle: date, timeStyle: time)
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        return dateFormatter.string(from: self)
    }
    
    public func dateToFormatter(formatter: DateFormatter.Style) -> String{
        return self.dateTimeToFormatter(date: formatter, time: .none)
    }
    
    public func dateToGregorianFormatter(formatter: DateFormatter.Style) -> String{
        return self.dateTimeToGregorianFormatter(date: formatter, time: .none)
    }
    
    public func timeToFormatter(formatter: DateFormatter.Style) -> String{
        return self.dateTimeToFormatter(date: .none, time:formatter)
    }
    
    public func timeToGregorianFormatter(formatter: DateFormatter.Style) -> String{
        return self.dateTimeToGregorianFormatter(date: .none, time:formatter)
    }
    
    public func combine(with time: Date) -> Date? {
        let calendar = NSCalendar.current
        
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
        
        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year!
        mergedComponments.month = dateComponents.month!
        mergedComponments.day = dateComponents.day!
        mergedComponments.hour = timeComponents.hour!
        mergedComponments.minute = timeComponents.minute!
        mergedComponments.second = timeComponents.second!
        
        return calendar.date(from: mergedComponments)
    }
    
    public func dateInRange(from: Date, to: Date, include: Bool = false) -> Bool {
        if include {
            return from <= self && self <= to
        } else {
            return from < self && self < to
        }
    }
}
