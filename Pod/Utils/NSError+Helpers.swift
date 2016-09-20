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
    
}
