//
//  PHAsset+Helpers.swift
//  Pods
//
//  Created by Alex on 09.03.16.
//
//

import Foundation
import Photos

extension PHAsset {
    
    public var originalImage : UIImage? {
        let manager = PHImageManager.defaultManager()
        let option = PHImageRequestOptions()
        option.synchronous = true
        var image : UIImage?
        manager.requestImageForAsset(self, targetSize: PHImageManagerMaximumSize, contentMode: .AspectFit, options: option, resultHandler: { (result, info) ->Void in
            image = result
        })
        return image
    }
}