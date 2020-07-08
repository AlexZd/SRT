//
//  CollectionType+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/11/16.
//
//

import Foundation

extension Collection {
    public var json: Data {
        return try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
    }
}
