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
    
    init(habit:Habit) {
        self.vm = HabitDetailViewModel(habit: habit)
    }
    
    var body: some View {
        VStack {
            // NavBar
            NavBar
            
            // Current Counter
            CurrentCounter
            
            // Goal
            DetailsGoal
            
            Spacer()
        }
        .background(Color.cBlue)
    }
}

extension HabitDetailView {
    var NavBar: some View {
        VStack(spacing: 20) {
            HStack{
                CircleButton(image: "arrow.left", action: {
                    dismiss()
                })
                
                Spacer()
                
                HStack {
                    Image(systemName: vm.habit.image)
                        .resizable()
                        .frame(width: 20, height:20)
                    
                    Text(vm.habit.name)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                CircleButton(image: "gearshape", action: {})
            }
            
            Divider()
                .overlay(.black)
        }
        .padding(.horizontal, 30)
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
    HabitDetailView(habit: Habit.myHabits[2])
}
