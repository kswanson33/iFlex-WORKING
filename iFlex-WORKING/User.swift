//
//  User.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import Foundation
import Firebase

struct User: Codable {
    var id: Int?
    var favorites: [Workout]?
    let userName: String!
}

// for debug purposes
func printUser(_ user: User) {
    print("Username: \(user.userName!)\nWorkouts: ")
    for w in user.favorites! {
        printWorkout(w)
    }
 
}

