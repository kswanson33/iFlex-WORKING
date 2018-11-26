//
//  User.swift
//  Storyboards
//
//  Created by labuser on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import Foundation
struct User: Codable {
    var id: Int?
    var favorites: [Workout]?
    let userName: String!
}

// for debug purposes
func printUser(_ user: User) {
    print("Username: \(user.userName)\nWorkouts: ")
    for w in user.favorites! {
        printWorkout(w)
    }
}
