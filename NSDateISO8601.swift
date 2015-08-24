//
//  NSDateISO8601.swift
//
//  Created by Justin Makaila on 8/11/14.
//  Copyright (c) 2014 Present, Inc. All rights reserved.
//

import Foundation

private struct ISONSDateFormatters {
    
    static let ISOStringFromDateFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
        }()
    
    static let dateFromISOStringFormatter: NSDateFormatter = {
        var dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
        }()
    
}

extension NSDate {
    
    class func ISOStringFromDate(date: NSDate) -> String {
        return ISONSDateFormatters.ISOStringFromDateFormatter.stringFromDate(date).stringByAppendingString("Z")
    }
    
    class func dateFromISOString(string: String) -> NSDate? {
        return ISONSDateFormatters.dateFromISOStringFormatter.dateFromString(string)
    }
}