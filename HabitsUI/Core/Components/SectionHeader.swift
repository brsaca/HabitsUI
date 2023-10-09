//
//  HabitsHeader.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 06/10/23.
//

import SwiftUI

/// SectionHeader. of completed habits
///
/// How to use it.
/// ```
/// SectionHeader(sectionTitle: 'completed', action: {})
/// ```
///

struct SectionHeader: View {
    // MARK: View Properties
    let sectionTitle: String
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                Text("habits")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.cGray)
                Text(sectionTitle)
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
    SectionHeader(sectionTitle: "completed", action: {})
}
