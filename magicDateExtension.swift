//
//  dateExtension.swift
//  MagicSwiftLibs
//
//  Created by MagicSpring on 4/18/18.
//  Copyright © 2018 MagicSpring. All rights reserved.
//

import Foundation

/*
    README DATE FORMAT

    y = 2014            E,EE,EEE = Wed
    yy = 14             EEEE     = Wednesday
    yyy = 2014          EEEEE    = W
    yyyy = 2014         EEEEEE   = We

    M = 7
    MM = 07
    MMM = Jul
    MMMM = July

    d = 4
    dd = 04

    README TIME FORMAT

    h = 1-12 based hour
    H = 0-23 based hour

    m = minute at least 1 digit
    mm = minute at least 2 digit

    s = second at least 1 digit
    ss = second at least 2 digit

    S, SS = fractional second (Tenths place)
    SSS = fractional second (Tenths, hundredths and thousanths place)
 */

extension Date {

    static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,
                                   .withTime,
                                   .withDashSeparatorInDate,
                                   .withColonSeparatorInTime]
        return formatter
    }()

    func currentDateTime(with stringFormat: String) -> String {
        let currentTime = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = stringFormat
        //dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        //dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let dateTimeFormat = dateFormatter.string(from: currentTime)
        #if DEBUG
        print(dateTimeFormat)
        #endif

        return dateTimeFormat
    }


    func reFormat(with dateString: String, toFormat: String) -> String {
        let dateFormString = dateFrom(string: dateString)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = toFormat
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let dateTimeFormat = dateFormatter.string(from: dateFormString)
        #if DEBUG
        print(dateTimeFormat)
        #endif
        return dateTimeFormat
    }


    func reFormat(with date: Date, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = toFormat
        /*dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
         //dateFormatter.timeZone = NSTimeZone.local
         dateFormatter.calendar = Calendar(identifier: .iso8601)*/
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let dateTimeFormat = dateFormatter.string(from: date)
        #if DEBUG
        print(dateTimeFormat)
        #endif
        return dateTimeFormat
    }


    func estimateTime(min: Int, withFormat: String) -> String {
        let estimateTime = Calendar.current.date(byAdding: .minute, value: min, to: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let dayStamp = dateFormatter.string(from: estimateTime!)

        #if DEBUG
        print(dayStamp)
        #endif

        return dayStamp
    }

    // ===========================================================================================================
    // This function will return estimate time
    //
    // EXAMPLE INPUT
    // startTime = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    // calMin = 238 (Minutes)
    // withFormat = "HH:mm"
    // ===========================================================================================================

    func estimateTime(startTime: String, calMin: Int, withFormat: String) -> String {
        let estimateTime = Calendar.current.date(byAdding: .minute, value: calMin, to: dateFrom(string: startTime))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        //dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        //dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let dayStamp = dateFormatter.string(from: estimateTime!)

        #if DEBUG
        print(dayStamp)
        #endif

        return dayStamp
    }

    func serviceTime(startDate: String, endDate: String) -> Int {

        let startDate: Date = dateFrom(string: startDate)
        let endDate: Date = dateFrom(string: endDate)

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: endDate)
        let countDownTime = calendar.nextDate(after: startDate, matching: components, matchingPolicy: .nextTime)
        let test = calendar.dateComponents([.hour, .minute, .second], from: startDate, to: countDownTime!)

        var time = 0

        if let hour = test.hour {
            time += (hour*60)
        }

        if let min = test.minute {
            time += min
        }

        #if DEBUG
        print(time)
        #endif

        return time
    }

    // ===========================================================================================================
    // CALCULATE PROGRESS BETWEEN START AND END TIME
    // ===========================================================================================================

    func inTimeProgress(startTime: String, endTime: String) -> Float {
        let startDate: Date = dateFrom(string: startService)
        let endDate: Date = dateFrom(string: endService)

        // All service time
        let allServiceTime = endDate.timeIntervalSince(startDate)

        // current service time
        let currentTime: Date = Date()
        let currentServiceTime = endDate.timeIntervalSince(currentTime)

        // Calculate progress
        if (allServiceTime-currentServiceTime) >= 0 {
            let progressServiceTime: Float = Float((allServiceTime-currentServiceTime)/allServiceTime)
            return progressServiceTime
        } else {
            return 100.0
        }
    }

    // ===========================================================================================================
    // CALCULATE TIME
    // ===========================================================================================================

    func timeLeft(startDate: String, endDate: String) -> String {
        //let startDate: Date = Date()
        let startDate: Date = dateFrom(string: startDate)
        let endDate: Date = dateFrom(string: endDate)

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: endDate)
        let countDownTime = calendar.nextDate(after: startDate, matching: components, matchingPolicy: .nextTime)

        let test = calendar.dateComponents([.hour, .minute, .second, .day], from: startDate, to: countDownTime!)

        var timeFormat: String = ""
        if let hour =  test.hour {
            if hour > 1 {
                timeFormat += "\(hour) hours "
            } else {
                timeFormat += "\(hour) hour "
            }
        }

        if let min = test.minute {
            if min > 1 {
                timeFormat += "\(min) minutes "
            } else {
                timeFormat += "\(min) minute "
            }
        }

        timeFormat += "left"
        return timeFormat
    }

    // ===========================================================================================================
    // CHANGE CUSTOM(s) STRING DATE FORMAT TO DATE FORMAT
    // ===========================================================================================================

    func dateFrom(string: String) -> Date {
        let formatSupport = [
            "yyyy-MM-dd",
            "dd/MM/yyyy",
            "dd / MMMM / yyyy",
            "dd/MMMM/yyyy",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        ]

        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        let converseDate = dateFormatter.date(from: string)

        for dateFormat in formatSupport {
            dateFormatter.dateFormat = dateFormat
            if let date = dateFormatter.date(from: string) {
                return date
            }
        }

        return converseDate!
    }
}
