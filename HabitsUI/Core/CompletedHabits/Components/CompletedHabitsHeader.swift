//
//  CompletedHabitsHeader.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 06/10/23.
//

import SwiftUI

/// CompletedHabitsHeader. of completed habits
///
/// How to use it.
/// ```
/// CompletedHabitsHeader(action: {})
/// ```
///

struct CompletedHabitsHeader: View {
    // MARK: View Properties
    let action: () -> Void
    
    var body: some View {
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
            
            CircleButton(image: "arrow.up.right", action: action)
            
        }
    }
}

#Preview {
    CompletedHabitsHeader(action: {})
}
