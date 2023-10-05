//
//  Date.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import Foundation

extension Date {
    func toGreeting() -> String {
        let calendar = NSCalendar.current
        let currentHour = calendar.component(.hour, from: self as Date)
        let hourInt = Int(currentHour.description)!
        
        let NEW_DAY = 0
        let NOON = 12
        let SUNSET = 18
        let MIDNIGHT = 24
        
        var greetingText = "" // Default greeting text
        if hourInt >= NEW_DAY && hourInt <= NOON {
            greetingText = "morning"
        }
        else if hourInt > NOON && hourInt <= SUNSET {
            greetingText = "afternoon"
        }
        else if hourInt > SUNSET && hourInt <= MIDNIGHT {
            greetingText = "evening"
        }
        
        return greetingText
    }
}
