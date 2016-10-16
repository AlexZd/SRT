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
        return self.absoluteString?.hasPrefix("assets") == true
    }
    
    public var isLocalURL: Bool {
        return self.absoluteString?.hasPrefix("file") == true || self.isFolder
    }
    
    public var isFolder: Bool {
        for prefix in Folder.allValues.map({ $0.rawValue.down }) {
            if self.absoluteString?.hasPrefix(prefix) == true {
                return true
            }
        }
        return false
    }
    
    public func relativeTo(folder: Folder) -> NSURL {
        if self.absoluteString?.hasPrefix("file:") == true {
            if let range = self.absoluteString?.rangeOfString(folder.rawValue) {
                return NSURL(string: "\(folder.rawValue.down)://\(self.absoluteString!.substringFromIndex(range.endIndex))")!
            }
        }
        return self
    }
    
    public var folderedURL : NSURL? {
        guard let scheme = self.scheme, let folder = Folder(rawValue: scheme.down), let absolute = self.absoluteString else { return nil }
        return NSURL(string: "file://\(folder.path)")!.URLByAppendingPathComponent(absolute.stringByReplacingOccurrencesOfString("\(folder.rawValue.down)://", withString: ""))
    }
    
}
