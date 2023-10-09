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
    @State private var showCompletedHabits: Bool = true
    @State private var showHabitDetail: Bool = false
    
    // Values for CompletedHabitsHeader animation 
    @State private var opacity: Double  = 0.0
    @State private var yOffset: CGFloat = 50
    @State private var scale: CGFloat = 0.1
    
    var body: some View {
        ZStack {
            VStack {
                // NavBar
                NavBar
                
                // Your habits
                YourHabits
                
                Spacer()
                
                if (!showCompletedHabits) {
                    CompletedHabitsHeader(action: {
                        withAnimation{
                            animateHeaderAppearance(for: false)
                            showCompletedHabits.toggle()
                        }
                            
                    })
                    .opacity(opacity) // Start with 0 opacity
                    .scaleEffect(x: scale, y: scale) // Start with scaled down size
                    .offset(y: yOffset) // Start with offset
                    .onAppear {
                        withAnimation {
                            animateHeaderAppearance(for: true)
                        }
                    }
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 30)
            .sheet(isPresented: $showCompletedHabits) {
                CompletedHabitsView(dismissCallback: {})
                    .ignoresSafeArea(.all)
            }
            .fullScreenCover(isPresented: $showHabitDetail, content: {
                HabitDetailView()
            })
        }
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
                .onTapGesture {
                    showHabitDetail.toggle()
                }
        }
        .padding(.vertical, 20)
    }
}

extension ContentView {
    private func animateHeaderAppearance(for isVisible:Bool) {
        opacity = isVisible ? 1.0 : 0.0
        yOffset = isVisible ? 0 : 50
        scale = isVisible ? 1 : 0.1
    }
}

// MARK: - Previews
#Preview {
    ContentView()
}
