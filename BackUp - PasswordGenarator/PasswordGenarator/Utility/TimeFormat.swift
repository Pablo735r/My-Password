//
//  TimeFormat.swift
//  PasswordGenarator
//
//  Created by Pablo Amador on 19/1/24.
//

import Foundation

class TimerManager: ObservableObject {
    @Published var currentTime = Date()
    
    private var timer: Timer?
    
    init() {
        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.currentTime = Date()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

func calculateTime(date: Date) -> String {
    let calendar = Calendar.current
    let now = Date()

    let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date, to: now)

    if let years = components.year, years > 0 {
        return "\(years) \(years == 1 ? "year" : "years") ago"
    } else if let months = components.month, months > 0 {
        return "\(months) \(months == 1 ? "month" : "months") ago"
    } else if let days = components.day, days > 0 {
        return "\(days) \(days == 1 ? "day" : "days") ago"
    } else if let hours = components.hour, hours > 0 {
        return "\(hours) \(hours == 1 ? "hour" : "hours") ago"
    } else if let minutes = components.minute, minutes > 0 {
        return "\(minutes) \(minutes == 1 ? "minute" : "minutes") ago"
    } else {
        return "Just now"
    }
}
