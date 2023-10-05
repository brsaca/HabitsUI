//
//  HabitCard.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import SwiftUI

/// Habit card for the home screen
///
/// How to use it.
/// ```
/// HabitCard(habit: habit)
/// ```
///
/// - Parameter
///   - habit: Habit model
///
struct HabitCard: View {
    // MARK: View Properties
    let habit: Habit
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: habit.image)
                    .resizable()
                    .frame(width: 20, height:20)
                
                Text(habit.name)
                    .font(habit.kind == .amount ? .largeTitle : .subheadline)
                
                Spacer()
            }
            
            if (habit.kind == .amount){
                Spacer()
                StatsAmountHabit
            }else {
                HStack {
                    Spacer()
                    
                    if (habit.kind != .min) {
                        Text("\(habit.progress)")
                    }
                    
                    Text(habit.detailsGoal)
                        .foregroundStyle(habit.kind.textColor.opacity(0.4))
                }
                .font(.title2)
            }
            
        }
        .padding()
        .background(habit.kind.color)
        .foregroundStyle(habit.kind.textColor)
        .cornerRadius(20)
        .frame(width: habit.kind.size.width, height: habit.kind.size.height)
        
    }
}

extension HabitCard {
    var StatsAmountHabit: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(habit.onlyDetails)
                    .font(.subheadline)
                    .foregroundStyle(Color.cGray)
                Text(habit.progressSlashGoal)
                    .font(.title3)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("max:")
                    .font(.subheadline)
                    .foregroundStyle(Color.cGray)
                Text(habit.maxDetails)
                    .font(.title3)
            }
            Spacer()
            VStack(alignment: .leading) {
                Text("streaks:")
                    .font(.subheadline)
                    .foregroundStyle(Color.cGray)
                Text(habit.streaksDetail)
                    .font(.title3)
            }
        }
        .padding()
    }
}

// MARK: - Previews
#Preview("Days") {
    HabitCard(habit: Habit.myHabits[0])
}

#Preview("Minutes") {
    HabitCard(habit: Habit.myHabits[1])
}

#Preview("Amount") {
    HabitCard(habit: Habit.myHabits[2])
}
