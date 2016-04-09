//
//  NSObject+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSObject {
    /** Returns class description. Useful for identifiers.  */
    public class var identifier : String {
        get {
            return NSStringFromClass(self).componentsSeparatedByString(".").last!
        }
    }
    
    /** Print list of Documents files */
    public func listFiles(folder:String?) {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

        guard let path = folder != nil ? NSURL(string: paths.first!)?.URLByAppendingPathComponent(folder!).absoluteString : paths.first else {
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
            print("Could not delete file: \(error)")
        }

    }
    
    /** Remove file with name from Documents folder */
    public func removeFile(fileName:String) {
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
    public func removeFileAt(path:String) {
        let fileURL = NSURL(fileURLWithPath: path)
        do {
            try NSFileManager.defaultManager().removeItemAtURL(fileURL)
            print("File at \(path) removed")
        } catch let error as NSError {
            print("Could not delete file: \(error)")
        }
    }
    
    /** Do something after delay */
    public func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}