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
    let foregroundColor: Color
    let backgroundColor: Color
    let strokeColor: Color
    
    init(image: String, action: @escaping () -> Void, foregroundColor: Color = .black, backgroundColor: Color = .clear, strokeColor: Color = .black) {
        self.image = image
        self.action = action
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                .resizable()
                .foregroundColor(foregroundColor)
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .padding()
        .background(backgroundColor)
        .clipShape( Circle() )
        .overlay(
            Circle()
                .stroke(strokeColor, lineWidth: 2 )
                .frame(width: 50, height: 50)
        )
        
    }
}

// MARK: - Previews
#Preview("normal") {
    CircleButton(image: "plus", action: {})
}

#Preview("bold") {
    CircleButton(image: "plus", action: {}, foregroundColor:.white, backgroundColor: .black, strokeColor: .clear)
}
