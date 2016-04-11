//
//  NSRange+Helpers.swift
//  Pods
//
//  Created by Alex on 09.04.16.
//
//

import Foundation

extension NSRange {
    
    public static var zero: NSRange {
        return NSRange(location: 0, length: 0)
    }
    
    public init(length: Int) {
        self.location = 0
        self.length = length
    }
    
}