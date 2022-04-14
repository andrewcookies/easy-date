//
//  ACEasyDate.swift
//  ACEasyDate
//
//  Created by Andrea Colussi on 14/04/22.
//

import Foundation

class ACEasyDate {
    
    private var currentDate : Date = Date()
    
    /// Value related to dateString property, default "dd/MM/yyyy"
    var acEasyDateformat : String = "dd/MM/yyyy"
    
    
    var epoch : Int {
        return Int(currentDate.timeIntervalSince1970)
    }
    
    
    var timestampMillis : Int {
        return Int(currentDate.timeIntervalSince1970*1000)
    }
    
    /// Full of the week day, following device language settings ("Sunday","Monday"...)
    var dayOfWeekLong : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: currentDate).capitalized
    }
    
    /// Half characters of the week day, following device language settings ("Sun","Mon"...)
    var dayOfWeekShort : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: currentDate).capitalized
    }
    
    /// First character of the week day, following device language settings ("S","M"...)
    var dayOfWeekInit : String {
        if let d = dayOfWeekLong.first {
            return "\(d)"
        }
        return dayOfWeekShort
    }
    
    /// ACEasyDate string value, following acEasyDateformat format, "dd/MM/yyyy" if not setted.
    var dateString : String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = acEasyDateformat
        return dateFormat.string(from: currentDate)
    }
    
    
    /// default constructor, ACEasyDate will refer to current date
    init() {
        currentDate = Date()
    }
    
    /// constructor with time in seconds (epoch)
    init(epoch : Int) {
        currentDate = Date(timeIntervalSince1970: TimeInterval(epoch))
    }
    
    /// constructor with time in milliseconds
    init(timeMillis : Int ) {
        currentDate = Date(timeIntervalSince1970: TimeInterval(timeMillis / 1000))
    }
    
    /// constructor with string and the related format, if format is unparsable ACEasyDate will refer to current date
    init( date : String, format : String ){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format

        acEasyDateformat = format
        if let d = dateFormatter.date(from: date) {
            currentDate = d
        } else {
            print("ACEasyDate parameters not correct")
            currentDate = Date()
        }
    }
    
    /// returns true if current ACEasyDate is after  "date" time, false otherwise
    func isAfter(_ date : ACEasyDate)-> Bool {
        return currentDate > date.currentDate
    }
    
    /// returns true if current ACEasyDate is after  "epoch" time, false otherwise
    func isAfter(_ epoch : Int ) -> Bool {
        return Int(currentDate.timeIntervalSince1970) > epoch
    }
    
    /// returns true if current ACEasyDate is after  "millis" time, false otherwise
    func isAfterMillis(_ millis : Int ) -> Bool {
        return Int(currentDate.timeIntervalSince1970*1000) > millis
    }
    
    /// returns true if current ACEasyDate is before  "date" time, false otherwise
    func isBefore(_ date : ACEasyDate)-> Bool {
        return currentDate < date.currentDate
    }
    
    /// returns true if current ACEasyDate is before  "epoch" time, false otherwise
    func isBefore(_ epoch : Int ) -> Bool {
        return Int(currentDate.timeIntervalSince1970) < epoch
    }
    
    /// returns true if current ACEasyDate is before  "millis" time, false otherwise
    func isBeforeMillis(_ millis : Int ) -> Bool {
        return Int(currentDate.timeIntervalSince1970*1000) < millis
    }

    /// returns true if "date" is in the same day of current ACEasyDate, false otherwise
    func isSameDay(_ date : ACEasyDate) -> Bool {
        return Calendar.current.isDate(currentDate, inSameDayAs:date.currentDate)
    }
    
    
    /// returns ACEasyDate with "timezone" time in currentTime
    func convertToCurrentTimeZone(from timezone: TimeZone) -> ACEasyDate {
        let currentTZseconds = TimeZone.current.secondsFromGMT()
        let formTZseconds = timezone.secondsFromGMT()
        let delta = formTZseconds - currentTZseconds
        return ACEasyDate(epoch: epoch - delta)
        
    }
    
    /// returns ACEasyDate with currentTime in the "timezione"
    func convertFromCurrentTimeZone(to timezone : TimeZone) -> ACEasyDate {
        let currentTZseconds = TimeZone.current.secondsFromGMT()
        let toTZseconds = timezone.secondsFromGMT()
        let delta = currentTZseconds - toTZseconds
        return ACEasyDate(epoch: epoch - delta)
    }
    
}
