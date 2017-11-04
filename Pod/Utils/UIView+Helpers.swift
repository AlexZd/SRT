//
//  UIView+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIView {
    
    public static func loadNib<T>() -> T {
        return Bundle.main.loadNibNamed(self.className, owner: self, options: nil)!.first as! T
    }
    
    /** Returns UIView's class name. */
    public class var className : String {
        return NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
    
    /** Returns UIView's nib. */
    public class var nib : UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    /** Get value of height constraint of UIView*/
    public var heightOfContstraint : CGFloat {
        let cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.height && $0.isMember(of: NSLayoutConstraint.self)}).first!
        return cnst.constant
    }
    
    /** Returns entity from it's nib. Nib should have same name as class name. */
    public class func getFromNib() -> Any {
        return Bundle.main.loadNibNamed(self.className, owner: self, options: nil)!.first!
    }
    
    /** Changes UIView width constraint and updates for superview */
    public func setWidth(width:CGFloat, update:Bool) {
        var cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.width && $0.isMember(of: NSLayoutConstraint.self)}).first
        if cnst == nil {
            if #available(iOS 9, *) {
                self.widthAnchor.constraint(equalToConstant: width).isActive = true
            } else {
                cnst = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
                self.addConstraint(cnst!)
            }
        }
        cnst?.constant = width
        if update{
            updateConstraints()
        }
    }
    
    /** Changes UIView height constraint and updates for superview */
    public func setHeight(height:CGFloat, update:Bool) {
        var cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.height && $0.isMember(of: NSLayoutConstraint.self)}).first
        if cnst == nil {
            if #available(iOS 9, *) {
                self.heightAnchor.constraint(equalToConstant: height).isActive = true
            } else {
                cnst = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
                self.addConstraint(cnst!)
            }
        }
        cnst?.constant = height
        if update{
            updateConstraints()
        }
    }
    
    /** Adds constraints to superview */
    public func setEdgeConstaints(edges:UIEdgeInsets, update:Bool) {
        guard let superview = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let leading = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1, constant: edges.left)
        let trailing = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1, constant: -1 * edges.right)
        let top = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1, constant: edges.top)
        let bottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1, constant: -1 * edges.bottom)
        superview.addConstraints([top, leading, trailing, bottom])
        if update{
            superview.updateConstraints()
        }
    }

    /** Perform shake animation for UIView*/
    public func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 20, -20, 10, 0];
        animation.keyTimes = [0, NSNumber(value: (1 / 6.0)), NSNumber(value: (3 / 6.0)), NSNumber(value: (5 / 6.0)), 1]
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.isAdditive = true
        
        self.layer.add(animation, forKey: "shake")
    }
    
    /** Screenshot of current view */
    public var screenshot : UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public func addSubview(_ view: UIView, top: CGFloat?, left: CGFloat?, bottom: CGFloat?, right: CGFloat?) {
        self.addSubview(view)
        if let top = top {
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: top).isActive = true
        }
        if let left = left {
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: left).isActive = true
        }
        if let bottom = bottom {
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: bottom * -1).isActive = true
        }
        if let right = right {
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: right * -1).isActive = true
        }
    }
}
