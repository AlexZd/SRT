//
//  CGRect+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 7/14/16.
//
//

import Foundation

extension CGRect {
    
    public var center : CGPoint {
        return CGPointMake(CGRectGetMidX(self), CGRectGetMidY(self))
    }
    
}