//
//  HabitsUIApp.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 04/10/23.
//

import SwiftUI

@main
struct HabitsUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(showCompletedHabits: true)
                .environment(\.font, Font.custom("Helvetica Neue", size: 14))

        }
    }
}
