//
//  UILabel+Helpers.swift
//  Scene
//
//  Created by Alex on 19.05.17.
//  Copyright © 2017 AlexZd. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    public convenience init(color: UIColor, alignment: NSTextAlignment = .left, lines: Int = 0, font: UIFont? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = lines
        self.textColor = color
        self.textAlignment = alignment
        if let font = font {
            self.font = font
        }
    }
    
}
