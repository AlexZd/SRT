//
//  Int+Helpers.swift
//  LobbyManager
//
//  Created by Ahsan Iqbal on 8/18/15.
//  Copyright (c) 2015 Farabi Technology Middle East. All rights reserved.
//

import Foundation

extension Int {
    
    public func thousandSeparated(separator:String?) -> String {
        return NSNumber(integer: self).thousandSeparated(separator)
    }
    
    public func roundUpToInteger (divisor: Int) -> Int {
        let rem = self % divisor
        return rem == 0 ? self : self + divisor - rem
    }
    
}
