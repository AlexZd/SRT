//
//  NSError+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSError {
    
    public convenience init(description:String) {
        let domain = "com.SRT.error"
        let userinfo = [NSLocalizedDescriptionKey : description]
        self.init(domain: domain, code: 0, userInfo: userinfo)
    }
    
    @available(*, deprecated=1.0, message="Use Error(description:) instead") public class func errorWith(string:String) -> NSError {
        let domain = "com.SRT.error"
        let userinfo = [NSLocalizedDescriptionKey : string]
        let error = NSError(domain: domain, code: 0, userInfo: userinfo)
        return error
    }
    
}