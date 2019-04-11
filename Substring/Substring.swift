//
//  Substring.swift
//  Substring
//
//  Created by Elias Abel on 2016-05-17.
//  Copyright © 2016 Meniny Lab. All rights reserved.
//

import Foundation

public extension String {

    // String[1]
    subscript(index: Int) -> Character? {
        guard !self.isEmpty, let stringIndex = self.index(startIndex, offsetBy: index, limitedBy: self.index(before: endIndex)) else { return nil }
        return self[stringIndex]
    }
    
    /// Substring at a specific index
    ///
    /// Also available as `String[Int]`
    ///
    /// - Parameter index: a character's index
    /// - Returns: the character
    func substring(at index: Int) -> Character? {
        return self[index]
    }
}

public extension String {

    // String[0..<1]
    subscript(range: Range<Int>) -> Substring? {
        guard let left = indexOffset(by: range.lowerBound) else { return nil }
        guard let right = index(left, offsetBy: range.upperBound - range.lowerBound, 
                                limitedBy: endIndex) else { return nil }
        return self[left..<right]
    }
    
    /// Substring between a specific range
    ///
    /// Also available as `String[Range<Int>]`
    ///
    /// - Parameter range: a range
    /// - Returns: the substring
    func substring(in range: Range<Int>) -> Substring? {
        return self[range]
    }
}

public extension String {

    // String[0...1]
    subscript(range: ClosedRange<Int>) -> Substring? {
        if range.upperBound < 0 {
            guard abs(range.lowerBound) <= count else { return nil }
            return self[(count - abs(range.lowerBound))...]
        }
        guard let left = indexOffset(by: range.lowerBound) else { return nil }
        guard let right = index(left, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
        return self[left...right]
    }
    
    /// Substring between a specific range
    ///
    /// Also available as `String[ClosedRange<Int>]`
    ///
    /// - Parameter range: a range
    /// - Returns: the substring
    func substring(in range: ClosedRange<Int>) -> Substring? {
        return self[range]
    }
}

public extension String {

    // String[..<1]
    subscript(value: PartialRangeUpTo<Int>) -> Substring? {
        if value.upperBound < 0 {
            guard abs(value.upperBound) <= count else { return nil }
            return self[..<(count - abs(value.upperBound))]
        }
        guard let right = indexOffset(by: value.upperBound) else { return nil }
        return self[..<right]
    }
    
    /// Substring before a specific index
    ///
    /// Also available as `String[PartialRangeUpTo<Int>]`
    ///
    /// - Parameter range: a index
    /// - Returns: the substring
    func substring(before index: Int) -> Substring? {
        return self[..<index]
    }
}

public extension String {

    // String[...1]
    subscript(value: PartialRangeThrough<Int>) -> Substring? {
        guard let right = self.indexOffset(by: value.upperBound) else { return nil }
        return self[...right]
    }
    
    /// Substring to a specific index
    ///
    /// Also available as `String[PartialRangeThrough<Int>]`
    ///
    /// - Parameter range: a index
    /// - Returns: the substring
    func substring(to index: Int) -> Substring? {
        return self[...index]
    }
}

public extension String {

    // String[1...]
    subscript(value: PartialRangeFrom<Int>) -> Substring? {
        guard let left = self.indexOffset(by: value.lowerBound) else { return nil }
        return self[left...]
    }
    
    /// Substring to a specific index
    ///
    /// Also available as `String[PartialRangeFrom<Int>]`
    ///
    /// - Parameter range: a index
    /// - Returns: the substring
    func substring(from index: Int) -> Substring? {
        return self[index...]
    }
}

public extension String {

    // String["substring"]
    subscript(string: String) -> [Range<String.Index>] {
        var occurences = [Range<String.Index>]()
        var initialLeftBound = startIndex
        while initialLeftBound < endIndex {
            guard let range = self.range(of: string, options: [], range: initialLeftBound..<endIndex, locale: nil) else { break }
            occurences.append(range)
            initialLeftBound = range.upperBound
        }
        return occurences
    }
    
    /// Get all the ranges of a specific substring
    ///
    /// Also available as `String[String]`
    ///
    /// - Parameter range: a substring
    /// - Returns: the ranges
    func ranges(of string: String) -> [Range<String.Index>] {
        return self[string]
    }
}

public extension String {

    // String["begin"..."end"]
    subscript(range: ClosedRange<String>) -> [ClosedRange<String.Index>] {
        var occurences = [ClosedRange<String.Index>]()
        var initialLeftBound = startIndex
        while initialLeftBound < endIndex {
            guard let beginRange = self.range(of: range.lowerBound, options: [], range: initialLeftBound..<endIndex, locale: nil) else { break }
            guard let endRange = self.range(of: range.upperBound, options: [], range: beginRange.upperBound..<endIndex, locale: nil) else { break }
            occurences.append(beginRange.lowerBound...endRange.upperBound)
            initialLeftBound = endRange.upperBound
        }
        return occurences
    }
    
    /// Get all the ranges between two specific substrings
    ///
    /// Also available as `String[ClosedRange<String>]`
    ///
    /// - Parameters:
    ///   - start: a substring
    ///   - end: a substring
    /// - Returns: the ranges
    func ranges(between start: String, and end: String) -> [ClosedRange<String.Index>] {
        return self[start...end]
    }
}

public extension String {

    // String["begin"..<"end"]
    subscript(range: Range<String>) -> [Range<String.Index>] {
        var occurences = [Range<String.Index>]()
        var initialLeftBound = startIndex
        while initialLeftBound < endIndex {
            guard let beginRange = self.range(of: range.lowerBound, options: [], range: initialLeftBound..<endIndex, locale: nil) else { break }
            guard let endRange = self.range(of: range.upperBound, options: [], range: beginRange.upperBound..<endIndex, locale: nil) else { break }
            occurences.append(beginRange.upperBound..<endRange.lowerBound)
            initialLeftBound = endRange.upperBound
        }
        return occurences
    }
    
    /// Get all the ranges between two specific substrings
    ///
    /// Also available as `String[Range<String>]`
    ///
    /// - Parameters:
    ///   - start: a substring
    ///   - end: a substring
    /// - Returns: the ranges
    func ranges(from start: String, before end: String) -> [Range<String.Index>] {
        return self[start..<end]
    }
}

public extension String {

    // String[Character("a")]
    subscript(character: Character) -> [String.Index] {
        var occurences = [String.Index]()
        var initialLeftBound = startIndex
        while initialLeftBound < endIndex {
            guard let beginRange = self.range(of: String(character), options: [], range: initialLeftBound..<endIndex, locale: nil) else { break }
            occurences.append(beginRange.lowerBound)
            initialLeftBound = beginRange.upperBound
        }
        return occurences
    }
    
    /// Get all the indexes of a specific character
    ///
    /// Also available as `String[Character]`
    ///
    /// - Parameters:
    ///   - character: a character
    /// - Returns: the indexes
    func indexes(of character: Character) -> [String.Index] {
        return self[character]
    }
}

public extension String {

    // String["begin"...]
    subscript(range: PartialRangeFrom<String>) -> PartialRangeFrom<String.Index>? {
        guard self.indexOffset(by: range.lowerBound.count) != nil else { return nil }
        guard let beginRange = self.range(of: range.lowerBound, options: [], range: startIndex..<endIndex, locale: nil) else { return nil }
        return beginRange.upperBound...
    }
    
    /// Get the range from a specific substrings to the end of the string
    ///
    /// Also available as `String[PartialRangeFrom<String>]`
    ///
    /// - Parameters:
    ///   - string: a substring
    /// - Returns: the ranges
    func range(from string: String) -> PartialRangeFrom<String.Index>? {
        return self[string...]
    }
}

public extension String {
    
    // String[..."end"]
    subscript(range: PartialRangeThrough<String>) -> PartialRangeThrough<String.Index>? {
        guard self.indexOffset(by: range.upperBound.count) != nil else { return nil }
        guard let endRange = self.range(of: range.upperBound, options: [], range: startIndex..<endIndex, locale: nil) else { return nil }
        return ...endRange.lowerBound
    }
    
    /// Get the range from the beginning of the string to a specific substrings
    ///
    /// Also available as `String[PartialRangeThrough<String>]`
    ///
    /// - Parameters:
    ///   - string: a substring
    /// - Returns: the ranges
    func range(to string: String) -> PartialRangeThrough<String.Index>? {
        return self[...string]
    }
}

public extension Character {
    
    var string: String {
        return String(self)
    }
}

public extension Optional where Wrapped == Character {
    
    var string: String? {
        guard let character = self else { return nil }
        return String(character)
    }
}

public extension Substring {

    var string: String {
        return String(self)
    }
}

public extension Optional where Wrapped == Substring {

    var string: String? {
        guard let substring = self else { return nil }
        return String(substring)
    }
}

extension String {

    // String + 1
    public func indexOffset(by distance: Int) -> String.Index? {
        return index(startIndex, offsetBy: distance, limitedBy: endIndex)
    }
}
