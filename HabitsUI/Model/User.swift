//
//  User.swift
//  HabitsUI
//
//  Created by Brenda Saavedra Cantu on 05/10/23.
//

import Foundation

struct User {
    let id = UUID()
    let name: String
    let image: String
}

extension User {
    static let myUser = User(name: "brenda saavedra", image: "bren")
}
