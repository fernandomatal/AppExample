//
//  Date+Extension.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/18/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation
import Marshal

extension Date : ValueType {
    public static func value(from object: Any) throws -> Date {
        guard let dateString = object as? String else {
            throw MarshalError.typeMismatch(expected: String.self, actual: type(of: object))
        }
        // assuming you have a Date.fromISO8601String implemented...
        guard let date = Date.fromISO8601String(dateString) else {
            throw MarshalError.typeMismatch(expected: "ISO8601 date string", actual: dateString)
        }
        return date
    }
    
    static func fromISO8601String(_ string: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZ"
        return dateFormatter.date(from: string)
    }
}
