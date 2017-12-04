//
//  Int+Helpers.swift
//  LobbyManager
//
//  Created by Ahsan Iqbal on 8/18/15.
//  Copyright (c) 2015 Farabi Technology Middle East. All rights reserved.
//

import Foundation

extension Int {
    public var isEven: Bool { return self % 2 == 0 }
    public var isOdd: Bool { return self % 2 != 0 }
    public var isPositive: Bool { return self > 0 }
    public var isNegative: Bool { return self < 0 }
    public var range: Range<Int> { return 0..<self }
    
    /** Returns thousand separated representation of number */
    public func thousandSeparated(separator: String?) -> String {
        return NSNumber(value: self).thousandSeparated(separator: separator)
    }
    
    public func roundUpToInteger(divisor: Int) -> Int {
        let rem = self % divisor
        return rem == 0 ? self : self + divisor - rem
    }
    
}
