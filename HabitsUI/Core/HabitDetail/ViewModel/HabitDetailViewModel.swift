//
//  HabitDetailViewModel.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 09/10/23.
//

import Foundation
import Observation

@Observable
class HabitDetailViewModel {
    let habit: Habit
    var currentProgress: Int = 0
    let ofGoal: String
    let perDay: String = "/ day"
    
    init(habit: Habit) {
        self.habit = habit
        self.currentProgress = habit.progress
        self.ofGoal = "of \(habit.goal) \(habit.details ?? "")"
    }
    
    
}

