//
//  UIStackView+Helpers.swift
//  Scene
//
//  Created by Alex on 19.05.17.
//  Copyright © 2017 AlexZd. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    public convenience init(alignment: UIStackViewAlignment = .fill, distribution: UIStackViewDistribution = .fill, spacing: CGFloat = 0, axis: UILayoutConstraintAxis = .vertical) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.axis = axis
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = .zero
    }
    
}
