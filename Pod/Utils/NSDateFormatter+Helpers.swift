//
//  NSDateFormatter+Helpers.swift
//
//  Created by Alex Zdorovets on 6/27/16.
//
//

import Foundation

extension NSDateFormatter {
    
    public convenience init(dateStyle:NSDateFormatterStyle, timeStyle:NSDateFormatterStyle) {
        self.init()
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
    
    public convenience init(dateFormat:String) {
        self.init()
        self.dateFormat = dateFormat
    }
    
    public convenience init(dateStyle:NSDateFormatterStyle) {
        self.init(dateStyle: dateStyle, timeStyle: .NoStyle)
    }
    
    public convenience init(timeStyle:NSDateFormatterStyle) {
        self.init(dateStyle: .NoStyle, timeStyle: timeStyle)
    }
    
}