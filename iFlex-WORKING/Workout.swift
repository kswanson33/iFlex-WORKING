//
//  Workout.swift
//  Storyboards
//
//  Created by labuser on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import Foundation
import UIKit

struct Workout: Codable {
    var title: String
    var time: TimeInterval      // specified in seconds -- is there a better data type?
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

