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
    @State private var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            // Header
            SectionHeader(kindView:.history, action: dismissCallback)
            
            Spacer()
            
        }
        .padding()
        .frame(width: .infinity, alignment: .leading)
        .presentationDetents( [.height(350)] )
    }
}

// MARK: - Previews
#Preview {
    HistoryHabitView(habit: Habit.myHabits[2], dismissCallback: {})
}
