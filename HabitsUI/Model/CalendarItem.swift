//
//  CalendarItem.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 09/10/23.
//

import Foundation

struct CalendarItem {
    let id = UUID()
    let day: Int
    let progress: Double
}

extension CalendarItem {
    static var MOCK_CALENDAR: [CalendarItem] = [
        CalendarItem(day: 1, progress: 80),
        CalendarItem(day: 2, progress: 0),
        CalendarItem(day: 3, progress: 0),
        CalendarItem(day: 4, progress: 40),
        CalendarItem(day: 5, progress: 70),
        CalendarItem(day: 6, progress: 0),
        CalendarItem(day: 7, progress: 80),
        CalendarItem(day: 8, progress: 60),
        CalendarItem(day: 9, progress: 50),
        CalendarItem(day: 10, progress: 0),
        CalendarItem(day: 11, progress: 70),
        CalendarItem(day: 12, progress: 0),
        CalendarItem(day: 13, progress: 30),
        CalendarItem(day: 14, progress: 0),
        CalendarItem(day: 15, progress: 60),
        CalendarItem(day: 16, progress: 0),
        CalendarItem(day: 17, progress: 0),
        CalendarItem(day: 18, progress: 10),
        CalendarItem(day: 19, progress: 30),
        CalendarItem(day: 20, progress: 0),
        CalendarItem(day: 21, progress: 20),
        CalendarItem(day: 22, progress: 40),
        CalendarItem(day: 23, progress: 70),
        CalendarItem(day: 24, progress: 0),
        CalendarItem(day: 25, progress: 0),
        CalendarItem(day: 26, progress: 0),
        CalendarItem(day: 27, progress: 0),
        CalendarItem(day: 28, progress: 0),
        CalendarItem(day: 29, progress: 0),
        CalendarItem(day: 30, progress: 90),
        
    ]
}
