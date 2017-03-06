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
    
    public init<T>(array: [T]) {
        var values = array
        self.init(buffer: UnsafeBufferPointer(start: &values, count: values.count))
    }
    
    public func array<T>(type: T.Type) -> [T] {
        return self.withUnsafeBytes {
            [T](UnsafeBufferPointer(start: $0, count: self.count/MemoryLayout<T>.stride))
        }
    }
    
}
