//
//  UIFont+Helpers.swift
//
//  Created by Alex Zdorovets on 6/18/15.
//  Copyright (c) 2015 Alex Zdorovets. All rights reserved.
//

import UIKit

extension UIFont {
    /** Prints Fonts list */
    public class func listOfFonts() {
        for family in UIFont.familyNames() {
            print("\nFamily: \(family)")
            for font in UIFont.fontNamesForFamilyName(family) {
                print("\tFont: \(font)\n")
            }
        }
    }
}