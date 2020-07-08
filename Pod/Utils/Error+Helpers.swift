//
//  Error+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension NSError {
    public convenience init(domain: String? = nil, code: Int? = nil, description: String) {
        let domain = domain ?? "com.SRT.error"
        let userinfo = [NSLocalizedDescriptionKey: description]
        self.init(domain: domain, code: code ?? 0, userInfo: userinfo)
    }
}
