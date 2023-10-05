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
    
    var body: some View {
        VStack {
            // NavBar
            NavBar
            
            // Your habits
            
            // Water
            
            Spacer()
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 30)
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
}

// MARK: - Previews
#Preview {
    ContentView()
}
