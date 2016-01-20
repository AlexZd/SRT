//
//  NSError+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSError {
    public class func errorWith(string:String) -> NSError {
        let domain = "com.s4m.lobbymanager"
        let userinfo = [NSLocalizedDescriptionKey : string]
        let error = NSError(domain: domain, code: 0, userInfo: userinfo)
        return error
    }
}