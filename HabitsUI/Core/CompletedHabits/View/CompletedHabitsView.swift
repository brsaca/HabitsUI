//
//  CompletedHabitsView.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 06/10/23.
//

import SwiftUI

/// Shows the list of the completed habits
struct CompletedHabitsView: View {
    // MARK: View Properties
    let vm: CompletedHabitsViewModel = CompletedHabitsViewModel()
    var dismissCallback: () -> Void
    
    var body: some View {
        VStack {
            SectionHeader(kindView: .completed, action: {})
            
            HabitsList
        }
        .padding()
        .onDisappear{
            dismissCallback()
        }
    }
}

extension CompletedHabitsView {
    var HabitsList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(vm.habits) { habit in
                    HabitRow(habit: habit)
                }
            }
        }
        .frame(width: .infinity, alignment: .leading)
        .presentationDetents( [.height(250)] )
    }
}

// MARK: - Previews
#Preview {
    CompletedHabitsView(dismissCallback: {})
}
