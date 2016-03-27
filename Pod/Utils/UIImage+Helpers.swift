//
//  UIImage+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIImage {
    
    public class func convertGradientToImage(colors: [UIColor], frame: CGRect, horizontal:Bool) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        
        gradientLayer.colors = colors.map({ $0.CGColor })
        
        if horizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        // now build a UIImage from the gradient
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.renderInContext(UIGraphicsGetCurrentContext()!)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return gradientImage
    }
    
    public func colorOverlay(color:UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.drawAtPoint(CGPointZero)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextTranslateCTM(context, 0.0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        CGContextSetBlendMode(context, CGBlendMode.Overlay)
        CGContextClipToMask(context, rect, self.CGImage)
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let returnImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return returnImage
    }
    
    /** Converting a color image to gray scale */
    public func convertToGrayScale() -> UIImage {
        let imageRect:CGRect = CGRectMake(0, 0, self.size.width, self.size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let width = self.size.width
        let height = self.size.height
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.None.rawValue)
        let context = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue)
        
        CGContextDrawImage(context, imageRect, self.CGImage)
        let imageRef = CGBitmapContextCreateImage(context)
        let newImage = UIImage(CGImage: imageRef!)
        
        return newImage
    }
    
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