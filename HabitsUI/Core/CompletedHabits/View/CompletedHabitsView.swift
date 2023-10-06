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
    
    var body: some View {
        VStack {
            NavBar
            
            HabitsList
        }
        .padding()
    }
}

extension CompletedHabitsView {
    var NavBar: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                Text("habits")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.cGray)
                Text("completed")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .padding(.top, -6)
            }
            
            Spacer()
            
            CircleButton(image: "arrow.up.right", action: {})
            
        }
    }
    
    var HabitsList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(vm.habits) { habit in
                    HabitRow(habit: habit)
                }
            }
        }
    }
}

// MARK: - Previews
#Preview {
    CompletedHabitsView()
}
