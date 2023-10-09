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
/// SectionHeader(kindView: .completed, action: {})
/// ```
///

enum KindView {
    case completed
    case history
    
    var title: String {
        switch self {
        case .completed: return "habits"
        case .history: return "habit"
        }
    }
    
    var subTitle: String {
        switch self {
        case .completed: return "completed"
        case .history: return "history"
        }
    }
}

struct SectionHeader: View {
    // MARK: View Properties
    let kindView: KindView
    let action: () -> Void
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 0) {
                Text(kindView.title)
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.cGray)
                Text(kindView.subTitle)
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .padding(.top, -6)
            }
            
            Spacer()
            
            CircleButton(image: "arrow.up.right", action: action)
            
        }
    }
}

// MARK: - Previews
#Preview("completed") {
    SectionHeader(kindView: .completed, action: {})
}

#Preview("history") {
    SectionHeader(kindView: .history, action: {})
}
