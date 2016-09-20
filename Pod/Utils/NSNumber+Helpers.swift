//
//  NSNumber+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSNumber {
    /** Returns NSNumber rounded to precision */
    public func roundToPrecision(precision:Int) -> NSNumber {
        let valueToRound = self.doubleValue
        let scale = pow(Double(10), Double(precision))
        var tmp = valueToRound * scale
        tmp = Double(Int(round(tmp)))
        let roundedValue = tmp / scale
        return NSNumber(value: roundedValue)
    }

    /** Returns price representation of number, nil for device currency */
    public func priceStr(currency:String?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if currency != nil {
            formatter.currencySymbol = currency!
        }
        formatter.maximumFractionDigits = 0
        return formatter.string(from: self)!
    }
    
    public func thousandSeparated(separator:String? = nil) -> String {
        let nf = NumberFormatter()
        if separator != nil {
            nf.groupingSeparator = separator
        }
        nf.numberStyle = .decimal
        return nf.string(from: self)!
    }
}
