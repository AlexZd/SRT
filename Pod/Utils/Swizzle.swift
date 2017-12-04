//
//  Swizzle.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import Foundation

public func SwizzleMethods(onClass: AnyClass, fromMethod: Selector, fromClass: AnyClass, toMethod: Selector) {
    guard let originalMethod = class_getInstanceMethod(onClass, fromMethod) else { return }
    guard let swizzledMethod = class_getInstanceMethod(fromClass, toMethod) else { return }
    
    let didAddMethod = class_addMethod(onClass, fromMethod, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
        class_replaceMethod(onClass, toMethod, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
