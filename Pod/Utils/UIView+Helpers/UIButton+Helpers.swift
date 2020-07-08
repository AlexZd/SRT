//
//  UIButton+Helpers.swift
//  Pods
//
//  Created by Alex on 01.05.16.
//
//

import Foundation

extension UIButton {
    public func centralizeTitle(spacing: CGFloat) {
        let imageSize: CGSize = self.imageView!.image!.size
        self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0.0)
        let labelString = NSString(string: self.titleLabel!.text!)
        let titleSize = labelString.size(withAttributes: [.font: self.titleLabel!.font])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
    }
}
