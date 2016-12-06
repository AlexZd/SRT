//
//  NSMutableParagraphStyle+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 12/6/16.
//
//

import Foundation

extension NSMutableParagraphStyle {
    
    public convenience init(alignment: NSTextAlignment) {
        self.init()
        self.alignment = alignment
    }
    
}
