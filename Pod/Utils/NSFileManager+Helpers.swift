//
//  NSFileManager+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/3/16.
//
//

import Foundation

extension NSFileManager {
    
    public struct Directory {
        public static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        public static let Cache = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        public static let Temp = NSTemporaryDirectory()
    }
    
}