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
    
    public func shouldAdd(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    public func shouldDelete(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    public func shouldUpdate(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    //MARK: - Will
    
    public func willAdd(model: AnyObject, options: AnyObject? = [:]) {}
    public func willUpdate(model: AnyObject, options: AnyObject? = [:]) {}
    public func willDelete(model: AnyObject, options: AnyObject? = [:]) {}
    
    //MARK: - Did
    
    public func didAdd(model: AnyObject, options: AnyObject? = [:]) {}
    public func didUpdate(model: AnyObject, options: AnyObject? = [:]) {}
    public func didDelete(model: AnyObject, options: AnyObject? = [:]) {}
}