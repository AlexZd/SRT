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
    
    public mutating func rotate(positions: Int, size: Int? = nil) {
        let size = size ?? self.count
        guard positions < self.count && size <= self.count else { return }
        self[0..<positions].reverse()
        self[positions..<size].reverse()
        self[0..<size].reverse()
    }
    
    public func rotated(positions: Int, size: Int? = nil) -> Array {
        var newArray = self
        newArray.rotate(positions: positions, size: size)
        return newArray
    }
}

extension Array where Element: Equatable {
    public mutating func appendIfPossible(_ newElement: Element?) {
        guard let item = newElement else { return }
        self.append(item)
    }
    
    /** Remove first collection element that is equal to the given 'object' */
    public mutating func remove(object: Element?) {
        guard let item = object else { return }
        if let index = self.index(of: item) {
            self.remove(at: index)
        }
    }
    
    public var unique2: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}

extension Array where Element: Hashable {
    /** Returns unique values of Array */
    public var unique: [Element] {
        return Array(Set(self))
    }
}
