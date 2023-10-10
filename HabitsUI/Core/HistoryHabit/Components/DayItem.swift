//
//  DayItem.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 09/10/23.
//

import SwiftUI

struct DayItem: View {
    // MARK: View Properties
    let calendarItem: CalendarItem
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack {
            CircularProgressView
                .frame(width: 40, height: 40)
        }
        .onAppear {
            withAnimation(.linear(duration: 1.0)) {
                progress = calendarItem.progress
            }
        }
    }
}

extension DayItem {
    var CircularProgressView: some View {
        ZStack {
            if progress == 0 {
                Circle()
                    .fill(Color.cBlue)
            } else if progress >= 90 && progress <= 100 {
                Circle()
                    .fill(Color.black)
            }
            
            Circle()
                .trim(from: 0, to: CGFloat(progress) / 100) // Use CGFloat and divide by 100
                .stroke(Color.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: -90)) // Rotate by -90 degrees
            
            Text("\(calendarItem.day)")
                .font(.footnote)
                .bold()
                .foregroundColor(calendarItem.progress >= 90 ? .white : .black)
        }
        
    }
}

// MARK: - Previews
#Preview("empty") {
    DayItem(calendarItem: CalendarItem(day: 1, progress: 0))
}

#Preview("withProgress") {
    DayItem(calendarItem: CalendarItem(day: 12, progress: 70))
}

#Preview("almostThere") {
    DayItem(calendarItem: CalendarItem(day: 22, progress: 90))
}

#Preview("full") {
    DayItem(calendarItem: CalendarItem(day: 30, progress: 100))
}
