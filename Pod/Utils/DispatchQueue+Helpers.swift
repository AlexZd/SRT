//
//  DispatchQueue+Helpers.swift
//
//  Created by Alex Zdorovets on 8/07/20.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

extension DispatchQueue {
    public static func delay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
}
