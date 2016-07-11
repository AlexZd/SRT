//
//  NSURL+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 7/11/16.
//
//

import Foundation

extension NSURL {
    
    public var isAssetsURL: Bool {
        return self.absoluteString.hasPrefix("assets")
    }
    
    public var isLocalURL: Bool {
        return self.absoluteString.hasPrefix("file") || self.isFolder
    }
    
    public var isFolder: Bool {
        for prefix in Folder.allValues.map({ $0.rawValue.down }) {
            if self.absoluteString.hasPrefix(prefix) {
                return true
            }
        }
        return false
    }
    
    public func relativeTo(folder: Folder) -> NSURL {
        if self.absoluteString.hasPrefix("file:") {
            if let range = self.absoluteString.rangeOfString(folder.rawValue) {
                return NSURL(string: "\(folder.rawValue.down)://\(self.absoluteString.substringFromIndex(range.endIndex))")!
            }
        }
        return self
    }
    
    public var folderedURL : NSURL? {
        guard let folder = Folder(rawValue: self.scheme.down) else { return nil }
        return NSURL(string: "file://\(folder.path)")!.URLByAppendingPathComponent(self.absoluteString.stringByReplacingOccurrencesOfString("\(folder.rawValue.down)://", withString: ""))
    }
    
}