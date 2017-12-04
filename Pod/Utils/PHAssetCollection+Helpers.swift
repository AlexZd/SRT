//
//  PHAssetCollection+Helpers.swift
//  Ardhi
//
//  Created by Alex Zdorovets on 1/4/16.
//  Copyright © 2016 Solutions 4 Mobility. All rights reserved.
//

import Photos

public typealias PhotosCompletionBlock = (_ collection: PHAssetCollection?) -> Void
public typealias PhotosAddImageCompletionBlock = (_ assetPlaceholder:PHObjectPlaceholder?, _ error: Error?) -> Void

extension PHAssetCollection {
    public class func saveImageToAlbum(image: UIImage, albumName: String, completionBlock: PhotosAddImageCompletionBlock?) {
        self.findOrCreateAlbum(name: albumName) { (collection) -> Void in
            collection?.addImage(image: image, completionBlock: completionBlock)
        }
    }
    
    /** Get album with name, if there is no such album it will be created */
    public class func findOrCreateAlbum(name: String, completionBlock: PhotosCompletionBlock?) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "title = %@", name)
        let collection = PHAssetCollection.fetchAssetCollections(with: PHAssetCollectionType.album, subtype: .any, options: fetchOptions)
        if let first = collection.firstObject {
            completionBlock?(first)
        } else {
            var assetCollectionPlaceholder : PHObjectPlaceholder!
            PHPhotoLibrary.shared().performChanges({
                let createAlbumRequest : PHAssetCollectionChangeRequest = PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: name)
                assetCollectionPlaceholder = createAlbumRequest.placeholderForCreatedAssetCollection
                }, completionHandler: { success, error in
                    DispatchQueue.main.async {
                        if (success) {
                            let collectionFetchResult = PHAssetCollection.fetchAssetCollections(withLocalIdentifiers: [assetCollectionPlaceholder.localIdentifier], options: nil)
                            completionBlock?(collectionFetchResult.firstObject)
                        }
                        completionBlock?(nil)
                    }
            })
        }
    }
    
    /** Adds UIImage to current album */
    public func addImage(image: UIImage, completionBlock: PhotosAddImageCompletionBlock?) {
        var assetPlaceholder: PHObjectPlaceholder?
        PHPhotoLibrary.shared().performChanges({ () -> Void in
            let createAssetRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            assetPlaceholder = createAssetRequest.placeholderForCreatedAsset
            if let albumChangeRequest = PHAssetCollectionChangeRequest(for: self) {
                let fastEnumeration = NSArray(array: [assetPlaceholder!] as [PHObjectPlaceholder])
                albumChangeRequest.addAssets(fastEnumeration)
            }
        }) { (success, error) -> Void in
            DispatchQueue.main.async {
                completionBlock?(assetPlaceholder, error)
            }
        }
    }
}
