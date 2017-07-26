//
//  ExDate.swift
//
//  Created by Shkelzen Hamza on 05/12/16.
//

import Foundation

infix operator ><

extension Date {
    
    //MARK: - Date components
    
    /// Gets the year of this date
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
    
    /// Gets the month number of this date
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    /// Gets the month name of this date
    var monthName: String {
        return Calendar.current.monthSymbols[month - 1];
    }
    
    /// Gets the week of year number of this date
    var weekOfYear: Int {
        return Calendar.current.component(.weekOfYear, from: self)
    }
    
    /// Gets the day number of year of this date
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    /// Gets the week day number of this date
    var weekDay: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    /// Gets the week day name of this date
    var weekDayName: String {
        return Calendar.current.weekdaySymbols[weekDay - 1]
    }
    
    //MARK: - Time components
    
    /// Gets the hours of this date
    var hours: Int {
        return Calendar.current.component(.hour, from: self)
    }
    
    /// Gets the minutes of this date
    var minutes: Int {
        return Calendar.current.component(.minute, from: self)
    }
    
    /// Gets the seconds of this date
    var seconds: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    /// Gets the milliseconds of this date
    var milliseconds: Int {
        return Calendar.current.component(.nanosecond, from: self) / 1_000_000
    }
    
    //MARK: - Functions
    /// Converts this date to string.
    ///
    /// - Returns: The string representation of this date.
    func toString(_ format: String? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format ?? "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: self)
    }
    
    /// Converts string to date.
    ///
    /// - Parameter string: String to convert
    /// - Returns: Converted date or nil if conversion failed
    static func new(_ string: String?) -> Date? {
        let formats = ["dd.MM.yyyy", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm:ss.SSS"]
        let formatter = DateFormatter()
        for format in formats {
            if format.characters.count == string?.characters.count {
                formatter.dateFormat = format
                return formatter.date(from: string!)
            }
        }
        return nil
    }
    
    /// Converts string to time.
    ///
    /// - Parameter string: String to convert
    /// - Returns: Converted date or nil if conversion failed
    static func time(_ string: String?) -> Date? {
        let formats = ["HH:mm", "HH:mm:ss"]
        let formatter = DateFormatter()
        for format in formats {
            if format.characters.count == string?.characters.count {
                formatter.dateFormat = format
                return formatter.date(from: string!)
            }
        }
        return nil
    }
    
    /// Extracts minutes between this date and input date.
    ///
    /// - Parameter date: Date to calculate minutes from
    /// - Returns: Minutes between this date and input date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute!
    }
    
    /// Compares this date to the lower and upper.
    ///
    /// - Parameters:
    ///   - lowerDate: Lower bound date
    ///   - upperDate: Upper bound date
    /// - Returns: True if this date is between lower and upper, otherwise false.
    func between(_ lowerDate: Date, _ upperDate: Date) -> Bool {
        return self >= lowerDate && self <= upperDate
    }
    
    //MARK: - Operators
    
    /// Compares left date to the right dates
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side dates (first is lower and second is upper)
    /// - Returns: True if left is between first and second right, otherwise false.
    ///
    /// Hint
    /// ----
    ///     var lower = Date.new("01-01-2016")!
    ///     var upper = Date.new("31.12.2016")!
    ///     var date = Date.new("01.06.2016")!
    ///     date >< (lower, upper) will return true
        static func ><(left: Date, right: (Date, Date)) -> Bool{
        return right.0 <= left && left <= right.1
    }
    
    /// Compares left side date to right side date.
    ///
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side date
    /// - Returns: True if left is greater than or equal to right, otherwise false.
    static func >=(left: Date, right: Date) -> Bool {
        return left > right || left == right
    }
    
    /// Compares left side date to right side date.
    ///
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side date
    /// - Returns: True if left is lower than or equal to right, otherwise false.
    static func <=(left: Date, right: Date) -> Bool {
        return left < right || left == right
    }
    
    /// Compares left side date to right side date.
    ///
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side date
    /// - Returns: True if left is equal to right, otherwise false.
    static func ==(left: Date, right: Date) -> Bool {
        return left.compare(right).rawValue == 0
    }
    
    /// Compares left side date to right side date.
    ///
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side date
    /// - Returns: True if left is lower than right, otherwise false.
    static func <(left: Date, right: Date) -> Bool{
        return left.compare(right).rawValue < 0
    }
    
    /// Compares left side date to right side date.
    ///
    /// - Parameters:
    ///   - left: Left side date
    ///   - right: Right side date
    /// - Returns: True if left is greater than right, otherwise false.
    static func >(left: Date, right: Date) -> Bool{
        return left.compare(right).rawValue > 0
    }
}
