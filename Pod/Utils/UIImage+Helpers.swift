//
//  UIImage+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIImage {
    /** Creates an UIImage which has size 1x1 with selected color */
    public class func imageWithColor(color:UIColor) -> UIImage {
        let rect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    /** Saves image to Application folder with name */
    public func saveImageWith(name:String, isTmp:Bool) {
        let data = UIImageJPEGRepresentation(self, 1)
        let folder = isTmp ? NSTemporaryDirectory() : String.applicationDocumentsDirectory
        guard let fullPath = NSURL(string: folder)?.URLByAppendingPathComponent(name).absoluteString else {
            return
        }
        NSFileManager.defaultManager().createFileAtPath(fullPath, contents: data, attributes: nil)
    }
    
    /** Change image size */
    public func resizeImageTo(maxSize:CGSize) -> UIImage {
        var newSize = maxSize
        if self.size.width > self.size.height {
            let k = self.size.height / self.size.width
            newSize = CGSizeMake(maxSize.width, maxSize.width * k)
        } else {
            let k = self.size.width / self.size.height
            newSize = CGSizeMake(maxSize.height * k, maxSize.height)
        }
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}