//
//  File.swift
//  Pods
//
//  Created by Alex Zdorovets on 3/6/16.
//
//

import Foundation

protocol ModelInteraction: class {
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
    
    func shouldAdd(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    func shouldDelete(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    func shouldUpdate(model: AnyObject, options: AnyObject? = [:]) -> Bool {
        return true
    }
    
    //MARK: - Will
    
    func willAdd(model: AnyObject, options: AnyObject? = [:]) {}
    func willUpdate(model: AnyObject, options: AnyObject? = [:]) {}
    func willDelete(model: AnyObject, options: AnyObject? = [:]) {}
    
    //MARK: - Did
    
    func didAdd(model: AnyObject, options: AnyObject? = [:]) {}
    func didUpdate(model: AnyObject, options: AnyObject? = [:]) {}
    func didDelete(model: AnyObject, options: AnyObject? = [:]) {}
}