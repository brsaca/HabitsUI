//
//  HistoryHabitView.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 09/10/23.
//

import SwiftUI

struct HistoryHabitView: View {
    // MARK: View Properties
    let habit: Habit
    var dismissCallback: () -> Void
    
    var body: some View {
        VStack {
            // Header
            SectionHeader(kindView:.history, action: dismissCallback)
            
            Spacer()
                .frame(height: 200)
        }
        .padding()
    }
}

// MARK: - Previews
#Preview {
    HistoryHabitView(habit: Habit.myHabits[2], dismissCallback: {})
}
