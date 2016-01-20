//
//  PHAssetCollection+Helpers.swift
//  Ardhi
//
//  Created by Alex Zdorovets on 1/4/16.
//  Copyright © 2016 Solutions 4 Mobility. All rights reserved.
//

import Photos

public typealias PhotosCompletionBlock = (collection: PHAssetCollection?) -> Void
public typealias PhotosAddImageCompletionBlock = (error: NSError?) -> Void

extension PHAssetCollection {
    public class func saveImageToAlbum(image:UIImage, albumName:String, completionBlock:PhotosAddImageCompletionBlock?) {
        self.findOrCreateAlbum(albumName) { (collection) -> Void in
            collection?.addImage(image, completionBlock: completionBlock)
        }
    }
    
    /** Get album with name, if there is no such album it will be created */
    public class func findOrCreateAlbum(name:String, completionBlock:PhotosCompletionBlock?) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", name)
        let collection = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Album, subtype: .Any, options: fetchOptions)
        if let first = collection.firstObject as? PHAssetCollection {
            completionBlock?(collection: first)
        }else{
            var assetCollectionPlaceholder : PHObjectPlaceholder!
            PHPhotoLibrary.sharedPhotoLibrary().performChanges({
                let createAlbumRequest : PHAssetCollectionChangeRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollectionWithTitle(name)
                assetCollectionPlaceholder = createAlbumRequest.placeholderForCreatedAssetCollection
                }, completionHandler: { success, error in
                    dispatch_async(dispatch_get_main_queue()) {
                        if (success) {
                            let collectionFetchResult = PHAssetCollection.fetchAssetCollectionsWithLocalIdentifiers([assetCollectionPlaceholder.localIdentifier], options: nil)
                            completionBlock?(collection: collectionFetchResult.firstObject as? PHAssetCollection)
                        }
                        completionBlock?(collection: nil)
                    }
            })
        }
    }
    
    /** Adds UIImage to current album */
    public func addImage(image:UIImage, completionBlock:PhotosAddImageCompletionBlock?) {
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
            let createAssetRequest = PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            let assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
            if let albumChangeRequest = PHAssetCollectionChangeRequest(forAssetCollection: self) {
                albumChangeRequest.addAssets([assetPlaceholder!])
            }
        }) { (success, error) -> Void in
            dispatch_async(dispatch_get_main_queue()) {
                completionBlock?(error: error)
            }
        }
    }
}