//
//  PHPhotoLibrary+Helpers.swift
//  Ardhi
//
//  Created by Alex Zdorovets on 2/1/16.
//  Copyright © 2016 Solutions 4 Mobility. All rights reserved.
//

import Photos

extension PHPhotoLibrary {
    /** Checks and asks (if needed) Photo library permissions  */
    class func isAuthorized(completion:(authorized:Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .Authorized:
                completion(authorized: true)
            default:
                completion(authorized: false)
            }
        }
    }
}