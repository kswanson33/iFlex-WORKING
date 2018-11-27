//
//  Workout.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import Foundation
import UIKit
import Firebase

struct Workout: Codable {
    var title: String
    var time: Int      // specified in seconds
    var exercises: [MyExercise]    // array of pairs: (exercise, number of reps)
    var difficulty: Int         // TODO: make into an enum
    var tags: [String]
    var priv: Bool
    var numOfExercises: Int
    var sharedWith: [String]
    var description: String
    var icon: WorkoutTarget
    
}
//enums too!!!! structs
enum WorkoutTarget: String, Codable {
    case upper
    case lower
    case core
    case fullBody
}

func printWorkout(_ workout: Workout) {
    print("\tTitle: \(workout.title)")
    print("\t\tDifficulty: \(workout.difficulty)")
    print("\t\tDescription: \(workout.description)")
    print("\tExercises: ")
    for e in workout.exercises {
        printMyExercise(e)
    }
}
