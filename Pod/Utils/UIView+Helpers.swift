//
//  UIView+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIView {
    
    /** Returns UIView's class name. */
    public class var className : String {
        get {
            return NSStringFromClass(self.classForCoder()).componentsSeparatedByString(".").last!
        }
    }
    
    /** Returns UIView's nib. */
    public class var nib : UINib {
        get {
            return UINib(nibName: self.className, bundle: nil)
        }
    }
    
    /** Get value of height constraint of UIView*/
    public var heightOfContstraint : CGFloat {
        get {
            let cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.Height && $0.isMemberOfClass(NSLayoutConstraint)}).first!
            return cnst.constant
        }
    }
    
    /** Returns entity from it's nib. Nib should have same name as class name. */
    public class func getFromNib() -> AnyObject {
        return NSBundle.mainBundle().loadNibNamed(self.className, owner: self, options: nil)!.first!
    }
    
    /** Changes UIView width constraint and updates for superview */
    public func setWidth(width:CGFloat, update:Bool) {
        var cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.Width && $0.isMemberOfClass(NSLayoutConstraint)}).first
        if cnst == nil {
            if #available(iOS 9, *) {
                self.widthAnchor.constraintEqualToConstant(width).active = true
            } else {
                cnst = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: width)
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
        var cnst = constraints.filter({$0.firstAttribute == NSLayoutAttribute.Height && $0.isMemberOfClass(NSLayoutConstraint)}).first
        if cnst == nil {
            if #available(iOS 9, *) {
                self.heightAnchor.constraintEqualToConstant(height).active = true
            } else {
                cnst = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: height)
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
        
        let leading = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: superview, attribute: .Leading, multiplier: 1, constant: edges.left)
        let trailing = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: superview, attribute: .Trailing, multiplier: 1, constant: -1 * edges.right)
        let top = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: superview, attribute: .Top, multiplier: 1, constant: edges.top)
        let bottom = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom, multiplier: 1, constant: -1 * edges.bottom)
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
        animation.keyTimes = [0, (1 / 6.0), (3 / 6.0), (5 / 6.0), 1]
        animation.duration = 0.3
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.additive = true
        
        self.layer.addAnimation(animation, forKey: "shake")
    }
    
    /** Screenshot of current view */
    public var screenshot : UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
