//
//  ContentViewModel.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import Foundation
import Observation

@Observable
class ContentViewModel {
    let myUser = User.myUser
    let myTime = Date().toGreeting() + ","
    
}
