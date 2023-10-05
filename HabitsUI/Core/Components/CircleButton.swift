//
//  CircleButton.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import SwiftUI

struct CircleButton: View {
    //MARK: View Properties
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .resizable()
                .foregroundColor(.black)
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(.white)
        .clipShape( Circle() )
        .overlay(
            Circle()
                .stroke(.black, lineWidth: 2 )
                .frame(width: 50, height: 50)
        )
        
    }
}

// MARK: - Previews
#Preview {
    CircleButton(image: "plus", action: {})
}
