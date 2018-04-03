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
    public var labelWidth: CGFloat {
        let rect = self.text?.boundingRect(with: CGSize(width: .greatestFiniteMagnitude, height: frame.size.height),
                                      options: .usesLineFragmentOrigin,
                                      attributes: [NSAttributedStringKey.font: font],
                                      context: nil) ?? .zero
        return rect.size.width
    }
    
    /** Height for current text in label */
    public var labelHeight: CGFloat {
        let rect = self.text?.boundingRect(with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
                                           options: .usesLineFragmentOrigin,
                                           attributes: [NSAttributedStringKey.font: font],
                                           context: nil) ?? .zero
        return rect.size.height
    }
    
    /** Width for current text in label with SizeToFit method */
    public var labelWidthSizeToFit: CGFloat {
        let sizeNew = self.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: frame.size.height))
        return sizeNew.width
    }
    
    /** Height for current text in label with SizeToFit method */
    public var labelHeightSizeToFit: CGFloat {
        let sizeNew = self.sizeThatFits(CGSize(width: frame.size.width, height: .greatestFiniteMagnitude))
        return sizeNew.height
    }
    
    /** Changes width constraint to fit text*/
    public func widthToFitConstraint(update: Bool) {
        self.setWidth(width: self.labelWidthSizeToFit, update: update)
    }
    
    /** Get size for current text in label with max and min size */
    public func getLabelSize(maxSize: CGSize, minSize: CGSize) -> CGSize {
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
    public func boundingRectForCharacterRange(range: NSRange) -> CGRect {
        let textStorage = NSTextStorage(attributedString: self.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0
        layoutManager.addTextContainer(textContainer)
        
        var glyphRange: NSRange = NSRange(location: 0, length: 1)
        layoutManager.characterRange(forGlyphRange: range, actualGlyphRange: &glyphRange)
        
        return layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
    }
}
