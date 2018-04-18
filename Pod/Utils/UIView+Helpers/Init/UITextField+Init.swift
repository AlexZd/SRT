//
//  UITextField+Init.swift
//  Alamofire
//
//  Created by Alex on 18.04.2018.
//

import Foundation
import UIKit

extension UITextField {
    
    public convenience init(background: UIColor? = nil, textColor: UIColor, font: UIFont?) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.backgroundColor = background
        self.textColor = textColor
        self.font = font
    }
    
}
