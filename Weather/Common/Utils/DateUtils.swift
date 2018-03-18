//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

import Foundation

extension String {
  var localizedDateStringFromISO8601: String? {
    if let dateFromString = self.dateFromISO8601 {
      let formatter = DateFormatter()
        let locale = Locale.current
      formatter.locale = locale
      formatter.dateStyle = .medium
      formatter.timeStyle = .none
      let dateString = formatter.string(from: dateFromString)
      return dateString
    }
    return nil
  }
}

extension Date {
  var isoDateString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssSSSZ"
    
    return formatter.string(from: self)
  }
  
  var dateFromStartOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }
  
  func greaterThan(_ anotherDate: Date, granularity: NSCalendar.Unit) -> Bool {
    let comparison = (Calendar.current as NSCalendar).compare(self, to: anotherDate, toUnitGranularity: granularity)
    
    return comparison == .orderedDescending
  }

  func lessThan(_ anotherDate: Date, granularity: NSCalendar.Unit) -> Bool {
    let comparison = (Calendar.current as NSCalendar).compare(self, to: anotherDate, toUnitGranularity: granularity)
    
    return comparison == .orderedAscending
  }

  func greaterThanOrEqualTo(_ anotherDate: Date, granularity: NSCalendar.Unit) -> Bool {
    let comparison = (Calendar.current as NSCalendar).compare(self, to: anotherDate, toUnitGranularity: granularity)
    
    return comparison == .orderedDescending || comparison == .orderedSame
  }

  func lessThanOrEqualTo(_ anotherDate: Date, granularity: NSCalendar.Unit) -> Bool {
    let comparison = (Calendar.current as NSCalendar).compare(self, to: anotherDate, toUnitGranularity: granularity)
    
    return comparison == .orderedAscending || comparison == .orderedSame
  }
  
}

extension Date {
  func relativeDateTo(_ time: Date) -> String? {
    
    func formattedDateFromFormat(_ format: String) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = format
        let locale = Locale.current
      formatter.locale = locale
      return formatter.string(from: self)
    }
    
    _ = time.timeIntervalSince(self)
    let _: Bool = true
    
//    if interval <= 1.minutes {
//      return NSLocalizedString("Now", comment: "Date display string: Now")
//    } else if (1.minutes..<2.minutes).contains(interval) {
//      return NSLocalizedString("1 minute ago", comment: "Date display string: 1 minute ago")
//    } else if (2.minutes..<1.hours).contains(interval) {
//      let timeInterval = stringFromTimeInterval(interval: interval, isMinuteInterval: isMinuteInterval)
//      return String(format: "%@ %@", timeInterval, NSLocalizedString("minutes ago", comment: "Date display string: 2 minutes ago"))
//    } else if (1.hours..<2.hours).contains(interval) {
//      return NSLocalizedString("1 hour ago", comment: "Date display string: 1 hour ago")
//    } else if (2.hours..<1.days).contains(interval) {
//      let timeInterval = stringFromTimeInterval(interval: interval, isMinuteInterval: !isMinuteInterval)
//      return String(format: "%@ %@", timeInterval, NSLocalizedString("hours ago", comment: "Date display string: 2 hours ago"))
//    } else if interval > 1.days {
//      return "\(formattedDateFromFormat("d MMM yyyy"))"
//    }
    
    return nil
  }
  
  func stringFromTimeInterval(interval: TimeInterval, isMinuteInterval: Bool) -> NSString {
    let timeInterval = NSInteger(interval)
    let minutes = (timeInterval / 60) % 60
    let hours = (timeInterval / 3600)
    
    if isMinuteInterval {
        return NSString(format: "%d", minutes)
    } else {
      return NSString(format: "%d", hours)
    }
  }
  
}

extension Date {
  struct Formatter {
    static let iso8601WithMiliseconds: DateFormatter = {
      // date format expected: 2017-08-21T08:15:29.000Z or 2017-08-21T08:15:29.000+08:00
      return iso8601Formatter(dateString: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }()
    
    static let iso8601: DateFormatter = {
      // date format expected: 2017-08-21T08:15:29Z or 2017-08-21T16:15:29+08:00
      return iso8601Formatter(dateString: "yyyy-MM-dd'T'HH:mm:ssZ")
    }()
    
    static func iso8601Formatter(dateString: String) -> DateFormatter {
      let formatter = DateFormatter()
      formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
      formatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      formatter.dateFormat = dateString
      return formatter
    }
  }
}

extension String {
  var dateFromISO8601: Date? {
    if let date = Date.Formatter.iso8601.date(from: self) {
      return date
    } else if let date = Date.Formatter.iso8601WithMiliseconds.date(from: self) {
      return date
    } else {
      if self != "" { assert(false, "Not a correct ISO8601 date format") }
      return nil
    }
  }
}

