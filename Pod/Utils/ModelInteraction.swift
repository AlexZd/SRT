//
//  File.swift
//  Pods
//
//  Created by Alex Zdorovets on 3/6/16.
//
//

import Foundation

public protocol ModelInteraction: class {
    func shouldAdd(model: Any, options: Any?) -> Bool
    func shouldDelete(model: Any, options: Any?) -> Bool
    func shouldUpdate(model: Any, options: Any?) -> Bool
    
    func willAdd(model: Any, options: Any?)
    func willUpdate(model: Any, options: Any?)
    func willDelete(model: Any, options: Any?)
    
    func didAdd(model: Any, options: Any?)
    func didUpdate(model: Any, options: Any?)
    func didDelete(model: Any, options: Any?)
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
