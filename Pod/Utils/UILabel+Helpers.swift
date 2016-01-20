//
//  UILabel+Helpers.swift
//  GPSChat
//
//  Created by Alex on 08.06.15.
//  Copyright (c) 2015 AlexZd. All rights reserved.
//

import UIKit

extension UILabel{
    /** Width for current text in label */
    public var labelWidth : CGFloat {
        get {
            let rect = text!.boundingRectWithSize(CGSizeMake(CGFloat.max, frame.size.height),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes:[NSFontAttributeName: font],
                context:nil)
            
            return rect.size.width
        }
    }
    
    /** Height for current text in label */
    public var labelHeight : CGFloat {
        get {
            let rect = text!.boundingRectWithSize(CGSizeMake(frame.size.height, CGFloat.max),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes:[NSFontAttributeName: font],
                context:nil)
            
            return rect.size.width
        }
    }
    
    /** Width for current text in label with SizeToFit method */
    public var labelWidthSizeToFit : CGFloat {
        get {
            let sizeNew = sizeThatFits(CGSizeMake(CGFloat.max, frame.size.height))
            return sizeNew.width
        }
    }
    /** Height for current text in label with SizeToFit method */
    public var labelHeightSizeToFit : CGFloat {
        get {
            let sizeNew = sizeThatFits(CGSizeMake(frame.size.width, CGFloat.max))
            return sizeNew.height
        }
    }
    
    /** Changes width constraint to fit text*/
    public func widthToFitConstraint(update:Bool) {
        setWidth(self.labelWidthSizeToFit, update: update)
    }
    
    /** Get size for current text in label with max and min size */
    public func getLabelSize(maxSize:CGSize, minSize:CGSize) -> CGSize {
        var sizeNew = sizeThatFits(maxSize)
        
        if sizeNew.height < minSize.height {
            sizeNew.height = minSize.height
        }
        
        if sizeNew.width < minSize.width {
            sizeNew.width = minSize.width
        }
        
        return sizeNew
    }
    
    /** Get CGRect of substring */
    public func boundingRectForCharacterRange(range:NSRange) -> CGRect{
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange : NSRange = NSRange(location: 0, length: 1)
        layoutManager.characterRangeForGlyphRange(range, actualGlyphRange: &glyphRange)
        
        return layoutManager.boundingRectForGlyphRange(glyphRange, inTextContainer: textContainer)
    }
}
