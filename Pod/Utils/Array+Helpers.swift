//
//  Array+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/13/16.
//
//

import Foundation

extension Array {
    
    public func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
}
