//
//  HabitRow.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 06/10/23.
//

import SwiftUI

/// Display the complete habit with the resume
///  Image, name and time
///
/// How to use it.
/// ```
/// HabitRow(habit: habit)
/// ```
///
struct HabitRow: View {
    // MARK: View Properties
    let habit: Habit
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 50, height: 50)
                
                Image(systemName: habit.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
            }
            
            Text(habit.name)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(habit.detailsGoal)
                .fontWeight(.light)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        .frame(maxWidth: .infinity)
        
    }
}

// MARK: - Previews
#Preview {
    HabitRow(habit: Habit.myHabits[3])
}
