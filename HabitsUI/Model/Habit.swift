//
//  Habit.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import Foundation
import SwiftUI

///  Enum with the options of the goal
///
///   - Options: 
///     - min
///     - days
///     - amount)
///   - Properties:
///     - size: CGSize of the card
///     - color: Color of the card and detail
enum KindGoal {
    case min
    case days
    case amount
    
    var size: CGSize {
        switch self {
        case .min: return CGSize(width: UIScreen.main.bounds.size.width * 0.32, height: 60)
        case .days: return CGSize(width: UIScreen.main.bounds.size.width * 0.5, height: 60)
        case .amount: return CGSize(width: UIScreen.main.bounds.size.width - 60 , height: 200)
        }
    }
    
    var color: Color {
        switch self {
        case .min: return Color.cYellow
        case .days: return Color.cBlack
        case .amount: return Color.cBlue
        }
    }
    
    var textColor: Color {
        switch self {
        case .min: return Color.cBlack
        case .days: return Color.white
        case .amount: return Color.cBlack
        }
    }
}

/// Model of an habit
///
///  - Properties
///    - id: UUID
///    - name: Habits name
///    - image: systemImage of the habit
///    - progress: 9/10
///    - goal
///    - max: max amount saved
///    - strike: days/in row
///    - kind: (min,, days, amount)
struct Habit: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let details: String?
    let progress: Int
    let goal: Int
    let max: Int
    let streaks: Int
    let kind: KindGoal
    
    var detailsGoal: String {
        switch kind {
        case .min: return "\(goal) min"
        case .days: return " / \(goal) days"
        case .amount: return " / \(goal) \(details ?? "")"
        }
    }
    
    var onlyDetails: String {
        guard let details = self.details else { return ""}
        return "\(details):"
    }
    
    var progressSlashGoal: String {
        return "\(progress) / \(goal)"
    }
    
    var maxDetails: String {
        switch kind {
        case .min: return "\(max) min"
        case .days: return "\(max) days"
        case .amount: return "\(max) \(details ?? "")"
        }
    }
    
    var streaksDetail: String {
        return "\(streaks) days"
    }
}

extension Habit {
    static let myHabits = [
        Habit(name: "no cigarrettes", image: "lungs", details: nil, progress: 9, goal: 21, max: 10, streaks: 15, kind: .days),
        Habit(name: "yoga", image: "figure.yoga", details: nil,  progress: 0, goal: 30, max: 1, streaks: 20, kind: .min),
        Habit(name: "water", image: "cup.and.saucer", details: "glasses", progress: 9, goal: 10, max: 17, streaks: 10, kind: .amount),
        Habit(name: "read", image: "books.vertical", details: nil, progress: 60, goal: 45, max: 90, streaks: 10, kind: .min),
        Habit(name: "run", image: "figure.run", details: nil, progress: 30, goal: 30, max: 45, streaks: 5, kind: .min),
    ]
}
