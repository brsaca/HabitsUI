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
    @State private var showHistory: Bool = true
    
    // Values for CompletedHabitsHeader animation
    @State private var opacity: Double  = 0.0
    @State private var yOffset: CGFloat = 50
    @State private var scale: CGFloat = 0.1
    
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
            
            if(!showHistory) {
                SectionHeader(kindView: .history, action: {
                    withAnimation{
                        animateHeaderAppearance(for: false)
                        showHistory.toggle()
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
        .background(Color.cBlue)
      /*  .sheet(isPresented: $showHistory) {
            HistoryHabitView(habit: vm.habit, dismissCallback: {})
                .ignoresSafeArea(.all)
        } */
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

extension HabitDetailView {
    private func animateHeaderAppearance(for isVisible:Bool) {
        opacity = isVisible ? 1.0 : 0.0
        yOffset = isVisible ? 0 : 50
        scale = isVisible ? 1 : 0.1
    }
}

// MARK: - Previews
#Preview {
    HabitDetailView(habit: Habit.myHabits[2])
}
