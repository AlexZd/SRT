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
    public var originalImage: UIImage? {
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        var image : UIImage?
        manager.requestImage(for: self, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: option, resultHandler: { (result, info) ->Void in
            image = result
        })
        return image
    }
}
