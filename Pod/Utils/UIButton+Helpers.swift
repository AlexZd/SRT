//
//  UIButton+Helpers.swift
//  Pods
//
//  Created by Alex on 01.05.16.
//
//

import Foundation

extension UIButton {
    public func centralizeTitle(spacing:CGFloat) {
        let imageSize: CGSize = self.imageView!.image!.size
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0)
        let labelString = NSString(string: self.titleLabel!.text!)
        let titleSize = labelString.sizeWithAttributes([NSFontAttributeName: self.titleLabel!.font])
        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width)
    }
}