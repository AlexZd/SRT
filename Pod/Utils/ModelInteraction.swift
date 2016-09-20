//
//  File.swift
//  Pods
//
//  Created by Alex Zdorovets on 3/6/16.
//
//

import Foundation

public protocol ModelInteraction: class {
    func shouldAdd(model: AnyObject, options: AnyObject?) -> Bool
    func shouldDelete(model: AnyObject, options: AnyObject?) -> Bool
    func shouldUpdate(model: AnyObject, options: AnyObject?) -> Bool
    
    func willAdd(model: AnyObject, options: AnyObject?)
    func willUpdate(model: AnyObject, options: AnyObject?)
    func willDelete(model: AnyObject, options: AnyObject?)
    
    func didAdd(model: AnyObject, options: AnyObject?)
    func didUpdate(model: AnyObject, options: AnyObject?)
    func didDelete(model: AnyObject, options: AnyObject?)
}

extension ModelInteraction {
    //MARK: - Shoulda
    
    public func shouldAdd(model: Any, options: Any? = [:]) -> Bool {
        return true
    }
    
    public func shouldDelete(model: Any, options: Any? = [:]) -> Bool {
        return true
    }
    
    public func shouldUpdate(model: Any, options: Any? = [:]) -> Bool {
        return true
    }
    
    //MARK: - Will
    
    public func willAdd(model: Any, options: Any? = [:]) {}
    public func willUpdate(model: Any, options: Any? = [:]) {}
    public func willDelete(model: Any, options: Any? = [:]) {}
    
    //MARK: - Did
    
    public func didAdd(model: Any, options: Any? = [:]) {}
    public func didUpdate(model: Any, options: Any? = [:]) {}
    public func didDelete(model: Any, options: Any? = [:]) {}
}
