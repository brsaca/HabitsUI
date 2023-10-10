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
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5),
        .init(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        VStack {
            // Header
            SectionHeader(kindView:.history, action: {})
            
            CalendarView
        }
        .padding()
        .frame(width: .infinity, alignment: .leading)
        .presentationDetents( [.height(300)] )
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)) 
    }
}

extension HistoryHabitView {
    var CalendarView: some View {
        LazyVGrid(columns: gridItems, spacing: 10) {
            ForEach(CalendarItem.MOCK_CALENDAR, id: \.id) { item in
                DayItem(calendarItem: item)
            }
        }
        .padding(.horizontal, 24)
    }
}

// MARK: - Previews
#Preview {
    HistoryHabitView(habit: Habit.myHabits[2])
}
