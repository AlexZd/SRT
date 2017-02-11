//
//  Array+Helpers.swift
//  Pods
//
//  Created by Alex Zdorovets on 4/13/16.
//
//


extension Array {
    public mutating func move(from: Int, to: Int) {
        let item = self.remove(at: from)
        self.insert(item, at: to)
    }
}

extension Array where Element: Equatable {
    /** Remove first collection element that is equal to the given 'object' */
    public mutating func remove(object: Element?) {
        guard let item = object else { return }
        if let index = self.index(of: item) {
            self.remove(at: index)
        }
    }
}

extension Array where Element: Hashable {
    /** Returns unique values of Array */
    public var unique: [Element] {
        return Array(Set(self))
    }
}
