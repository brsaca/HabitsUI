//
//  ContentView.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: View Properties
    let viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            // NavBar
            NavBar
            
            // Your habits
            YourHabits
            
            Spacer()
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
    }
}

extension ContentView {
    var NavBar: some View {
        VStack(spacing: 20) {
            HStack{
                Image(viewModel.myUser.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(viewModel.myTime)
                    Text(viewModel.myUser.name.capitalized)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                CircleButton(image: "plus", action: {})
            }
            
            Divider()
                .overlay(.black)
        }
    }
    
    var YourHabits: some View {
        VStack(alignment: .leading) {
            // Title
            VStack(alignment: .leading, spacing: 0) {
                Text("track")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.cGray)
                Text("your habits")
                    .font(.system(size: 66))
                    .fontWeight(.regular)
                    .padding(.top, -16)
            }
            .padding(.bottom, 30)
            
            // Days & Min habits
            HStack {
                HabitCard(habit: Habit.myHabits[0])
                HabitCard(habit: Habit.myHabits[1])
            }
            .padding(.bottom, 14)
            
            // Amount habit
            HabitCard(habit: Habit.myHabits[2])
        }
        .padding(.vertical, 20)
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
