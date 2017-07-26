//
//  ExString.swift
//
//  Created by Shkelzen Hamza on 05/12/16.
//

import Foundation

extension String {
    
    /// Gets the character count of thi string.
    var length: Int { get { return self.characters.count}}
    
    /// Converts the string to double.
    ///
    /// - returns: The number
    func toDouble() -> Double? {
        guard let double = Double(self) else {
            return nil
        }
        return double
    }
    
    /// Converts the string to float.
    ///
    /// - returns: The number
    func toFloat() -> Float? {
        guard let float = Float(self) else {
            return nil
        }
        return float
    }
    
    /// Converts the string to NSNumber.
    ///
    /// - returns: The number
    func toNSNumber() -> NSNumber? {
        guard let int = Int(self) else {
            return nil
        }
        return NSNumber(value: int)
    }

    /// Gets the character at the given position.
    ///
    /// - parameter at: The position to look for
    ///
    /// - returns: The character
    func char(_ at: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: at)]
    }
    
    /// Gets the index of given character position.
    ///
    /// - Parameter of: Wanted position
    /// - Returns: The index
    func index(_ of: Int) -> Index {
        return self.index(startIndex, offsetBy: of)
    }
    
    /// Gets a substring from the given position to the last position.
    ///
    /// - Parameter from: Lower bound position
    /// - Returns: The substring
    func substring(from: Int) -> String {
        let fromIndex = index(from)
        return substring(from: fromIndex)
    }
    
    /// Gets a substring from 0 position to the given position.
    ///
    /// - Parameter to: Upper bound position
    /// - Returns: The substring
    func substring(to: Int) -> String {
        let toIndex = index(to)
        return substring(to: toIndex)
    }
    
    /// Gets a substring of this string according to the range (ex. 5...10)
    ///
    /// - Parameter range: The range
    /// - Returns: The substring
    func substring(with range: Range<Int>) -> String {
        let startIndex = index(range.lowerBound)
        let endIndex = index(range.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    /// Trims the given string according to parameters.
    /// By default, removes white spaces and new lines.
    ///
    /// - parameter trimWhiteSpace: Should trim white spaces: true by default
    /// - parameter trimNewLine:    Should trim new lines: true by default
    ///
    /// - returns: The trimmed string
    func trim(trimWhiteSpace: Bool? = true, trimNewLine: Bool? = true) -> String {
        if trimWhiteSpace! && trimNewLine! {
            return self.trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            if trimWhiteSpace! {
                return self.trimmingCharacters(in: .whitespaces)
            }
            if trimNewLine! {
                return self.trimmingCharacters(in: .newlines)
            }
        }
        return self
    }
    
}
