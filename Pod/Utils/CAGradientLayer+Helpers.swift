//
//  CAGradientLayer+Helpers.swift
//  Pods
//
//  Created by Alex on 26.02.16.
//
//

import Foundation
import UIKit

extension CAGradientLayer {
    
    public convenience init(colors: Array<UIColor>, frame: CGRect, horizontal:Bool) {
        self.init()
        
        self.frame = frame
        
        self.colors = colors.map({ $0.CGColor })
        
        if horizontal {
            self.startPoint = CGPoint(x: 0.0, y: 0.5)
            self.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
    }
    
}
