//
//  HabitDetailView.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 09/10/23.
//

import SwiftUI

struct HabitDetailView: View {
    //MARK: View Properties
    let vm: HabitDetailViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isGoalCompleted: Bool = false
    @Binding var showHabitDetail: Bool
    @State private var showAllScreen: Bool = false
    var namespace: Namespace.ID
    
    init(habit:Habit, namespace: Namespace.ID, showHabitDetail: Binding<Bool>) {
        self.vm = HabitDetailViewModel(habit: habit)
        self.namespace = namespace
        self._showHabitDetail = showHabitDetail
    }
    
    var body: some View {
        VStack {
            // NavBar
            NavBar
            
            if (showAllScreen) {
                if (isGoalCompleted) {
                    // Message Completed
                    MessageStreak
                }else{
                    // Current Counter
                    CurrentCounter
                    
                    // Goal
                    DetailsGoal
                }
            }
            
            Spacer()
            
            if (showAllScreen) {
                // History
                HistoryHabitView(habit: vm.habit)
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut) {
                    showAllScreen.toggle()
                }
            }
        }
        .padding(.top, 60)
        .background(Color.cBlue)
        .ignoresSafeArea(.all)
    }
}

extension HabitDetailView {
    var NavBar: some View {
        VStack(spacing: 20) {
            HStack{
                if (showAllScreen) {
                    CircleButton(image: "arrow.left", action: {
                        //dismiss()
                        self.showHabitDetail.toggle()
                    })
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: vm.habit.image)
                        .resizable()
                        .frame(width: 20, height:20)
                        .matchedGeometryEffect(id: "icon", in: namespace)
                    
                    Text(vm.habit.name)
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: "name", in: namespace)
                }
                
                Spacer()
                
                if (showAllScreen) {
                    CircleButton(image: "gearshape", action: {})
                }
            }
            
            Divider()
                .overlay(.black)
        }
        .padding(.horizontal, 30)
    }
    
    var MessageStreak: some View {
        VStack {
            Spacer()
            
            Text("streak!")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("you've been sticking to your goal for 8 consecutive days")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.top, 10)
                .foregroundStyle(Color.cGray)
            
            Spacer()
        }
        
    }
    
    var CurrentCounter: some View {
        HStack(spacing: 5) {
            CircleButton(image: "minus", action: {
                withAnimation(.easeInOut) {
                    vm.currentProgress -= 1
                }
            })
            
            Text("\(vm.currentProgress)")
                .font(.system(size: 150))
                .fontWeight(.light)
                .frame(maxWidth: 170)
            
            
            CircleButton(image: "plus", action: {
                withAnimation(.easeInOut) {
                    vm.currentProgress += 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.smooth) {
                            isGoalCompleted = vm.currentProgress == vm.habit.goal
                        }
                    }
                }
            }, foregroundColor:.white, backgroundColor: .black, strokeColor: .clear)
        }
        .padding(.top, 50)
    }
    
    var DetailsGoal: some View {
        HStack(alignment:.bottom, spacing: 3) {
            Text(vm.ofGoal)
                .font(.system(size: 36))
                .fontWeight(.regular)
            
            Text(vm.perDay)
                .font(.callout)
                .padding(.bottom, 5)
                .foregroundStyle(Color.cGray)
        }
    }
}

// MARK: - Previews
#Preview {
    @Namespace var namespace
    return HabitDetailView(habit: Habit.myHabits[2], namespace: namespace, showHabitDetail: .constant(true))
}
