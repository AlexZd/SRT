//
//  UIView+Helpers.swift
//  Scene
//
//  Created by Alex on 23.01.19.
//  Copyright © 2019 AlexZd. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableParagraphStyle {
    public convenience init(alignment: NSTextAlignment? = nil, lineHeight: CGFloat? = nil) {
        self.init()
        if let alignment = alignment { self.alignment = alignment }
        if let lineHeight = lineHeight { self.minimumLineHeight = lineHeight }
    }
}
