//
//  UIDevice+Hardware.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

public let IS_IPAD : Bool = UIDevice.currentDevice().userInterfaceIdiom == .Pad
public let IS_IPHONE : Bool = UIDevice.currentDevice().userInterfaceIdiom == .Phone
public let IS_IPHONE_4 : Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 480.0)
public let IS_IPHONE_5 : Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 568.0)
public let IS_IPHONE_6 : Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 667.0)
public let IS_IPHONE_6_PLUS : Bool = (IS_IPHONE && UIScreen.mainScreen().bounds.size.height == 736.0)
public let IS_RETINA : Bool = UIScreen.mainScreen().scale == 2