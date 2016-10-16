//
//  NSFileManager+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/3/16.
//
//

import Foundation

public enum Folder: String {
    case Documents = "documents"
    case Cache = "cache"
    case Temp = "temp"
    
    public var path : String {
        switch self {
        case .Documents: return NSFileManager.Directory.Documents
        case .Cache: return NSFileManager.Directory.Cache
        case .Temp: return NSFileManager.Directory.Temp
        }
    }
    
    public static let allValues: Array<Folder> = [.Documents, .Cache, .Temp]
}

extension NSFileManager {
    
    public struct Directory {
        public static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        public static let Cache = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        public static let Temp = NSTemporaryDirectory()
    }
    
    /** Print list of Documents files */
    public class func listFiles(folder:String?) {
        var paths = NSFileManager.Directory.Documents
        if let folder = folder {
            paths = NSURL(fileURLWithPath: paths).URLByAppendingPathComponent(folder)!.path!
        }
        do {
            let directoryContent = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(paths)
            print("+--------------------------------------+")
            print("| FILES:                               |")
            print("+--------------------------------------+")
            for i in 0..<directoryContent.count {
                print("| \(i + 1). \(directoryContent[i])")
            }
            print("+--------------------------------------+")
        } catch let error as NSError {
            print("Could not find path: \(error)")
        }
    }
    
    /** Remove file with name from Documents folder */
    public class func removeFile(fileName:String) {
        guard let fileURL = NSURL(fileURLWithPath: NSFileManager.Directory.Documents).URLByAppendingPathComponent(fileName) else { return }
        do {
            try NSFileManager.defaultManager().removeItemAtURL(fileURL)
            print("File \(fileName) removed")
        } catch let error as NSError {
            print("Could not delete file: \(error)")
        }
            
    }
    
    /** Remove file at path */
    public class func removeFileAt(path:String?) {
        guard let path = path else {
            return
        }
        let fileURL = NSURL(fileURLWithPath: path)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(fileURL)
            print("File at \(path) removed")
        } catch let error as NSError {
            print("Could not delete file: \(error)")
        }
    }
    
}
