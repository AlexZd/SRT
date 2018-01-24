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
    public class func isAuthorized(completion:@escaping (_ authorized:Bool) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    completion(true)
                default:
                    completion(false)
                }
            }
        }
    }
}
