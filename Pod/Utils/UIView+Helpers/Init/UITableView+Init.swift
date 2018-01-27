//
//  UITableView+Helpers.swift
//  Scene
//
//  Created by Alex on 19.05.17.
//  Copyright © 2017 AlexZd. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    public static func table(separatorInset: UIEdgeInsets = .zero, separatorColor: UIColor? = nil, multiply: Bool = false) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.prepareTable(separatorInset: separatorInset, separatorColor: separatorColor, multiply: multiply)
        return tableView
    }
    
    public func prepareTable(separatorInset: UIEdgeInsets = .zero, separatorColor: UIColor? = nil, multiply: Bool = false) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.allowsMultipleSelection = multiply
        self.separatorInset = separatorInset
        self.tableFooterView = UIView()
        self.showsVerticalScrollIndicator = false
        self.estimatedSectionFooterHeight = 0
        self.estimatedSectionHeaderHeight = 0
        if let color = separatorColor {
            self.separatorColor = color
        }
    }
    
}
