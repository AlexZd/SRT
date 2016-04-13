//
//  NSFileManager+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/3/16.
//
//

import Foundation

extension NSFileManager {
    
    public struct Directory {
        public static let Documents = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        public static let Cache = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
        public static let Temp = NSTemporaryDirectory()
    }
    
    /** Print list of Documents files */
    public class func listFiles(folder:String?) {
        let paths = NSFileManager.Directory.Documents
        
        guard let path = (folder != nil ? NSURL(string: paths)?.URLByAppendingPathComponent(folder!).absoluteString : paths) else {
            return
        }
        
        do {
            let directoryContent = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(path)
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
        guard let fileURL = NSURL(string: NSFileManager.Directory.Documents)?.URLByAppendingPathComponent(fileName) else {
            print("File not found")
            return
        }
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