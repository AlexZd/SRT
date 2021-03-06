//
//  NSURL+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 7/11/16.
//
//

import Foundation

extension URL {
    public var isAssetsURL: Bool {
        return self.absoluteString.hasPrefix("assets")
    }
    
    public var isLocalURL: Bool {
        return self.absoluteString.hasPrefix("file") || self.isFolder
    }
    
    public var isWebURL: Bool {
        return self.absoluteString.hasPrefix("http")
    }
    
    public var isFolder: Bool {
        for prefix in Folder.allValues.map({ $0.rawValue.down }) {
            if self.absoluteString.hasPrefix(prefix) {
                return true
            }
        }
        return false
    }
    
    public func relativeTo(folder: Folder) -> URL {
        if self.absoluteString.hasPrefix("file:") {
            if let range = self.absoluteString.range(of: folder.rawValue) {
                return URL(string: "\(folder.rawValue.down)://\(self.absoluteString.substring(from: range.upperBound))")!
            }
        }
        return self
    }
    
    public var folderedURL : URL? {
        guard let scheme = self.scheme, let folder = Folder(rawValue: scheme.down) else { return nil }
        return URL(string: "file://\(folder.path)")?.appendingPathComponent(self.absoluteString.replacingOccurrences(of: "\(folder.rawValue.down)://", with: ""))
    }
    
    public var parameters: [String: String] {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return [:]
        }
        var parameters: [String: String] = [:]
        for item in queryItems {
            parameters[item.name] = item.value
        }
        return parameters
    }
    
    public subscript(param:String) -> String? {
        return self.parameters[param]
    }
    
}
