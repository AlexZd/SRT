//
//  NSFileManager+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/3/16.
//
//

import Foundation

public enum Folder: String {
    case documents = "documents"
    case cache = "cache"
    case temp = "temp"
    
    public var path: String {
        switch self {
        case .documents: return FileManager.Directory.Documents
        case .cache: return FileManager.Directory.Cache
        case .temp: return FileManager.Directory.Temp
        }
    }
    
    public static let allValues: Array<Folder> = [.documents, .cache, .temp]
}

extension FileManager {
    public struct Directory {
        public static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        public static let Cache = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        public static let Temp = NSTemporaryDirectory()
    }
    
    /** Print list of Documents files */
    public class func listFiles(folder: String?) {
        var paths = FileManager.Directory.Documents
        if let folder = folder {
            paths = URL(fileURLWithPath: paths).appendingPathComponent(folder).path
        }
        do {
            let directoryContent = try FileManager.default.contentsOfDirectory(atPath: paths)
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
    public class func removeFile(fileName: String) {
        let fileURL = URL(fileURLWithPath: FileManager.Directory.Documents).appendingPathComponent(fileName)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("File \(fileName) removed")
        } catch let error as NSError {
            print("Could not delete file: \(error)")
        }
            
    }
    
    /** Remove file at path */
    public class func removeFileAt(path: String?) {
        guard let path = path else { return }
        let fileURL = URL(fileURLWithPath: path)
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("File at \(path) removed")
        } catch let error as NSError {
            print("Could not delete file: \(error)")
        }
    }
    
}
