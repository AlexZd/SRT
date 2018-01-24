//
//  UIView+Helpers.swift
//  Scene
//
//  Created by Alex on 19.05.17.
//  Copyright © 2017 AlexZd. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public convenience init(background: UIColor? = nil, height: CGFloat? = nil, width: CGFloat? = nil) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = background
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
}
