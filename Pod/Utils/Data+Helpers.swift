//
//  Data+Helpers.swift
//  Pods
//
//  Created by Alex on 30.10.16.
//
//

import Foundation

extension Data {
    
    public var string : String? {
        return String(data: self, encoding: String.Encoding.utf8)
    }
    
}
