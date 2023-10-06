//
//  CompletedHabitsViewModel.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 06/10/23.
//

import Foundation
import Observation

@Observable
class CompletedHabitsViewModel {
    let habits: [Habit] = Habit.myHabits.filter({$0.progress >= $0.goal})
}
