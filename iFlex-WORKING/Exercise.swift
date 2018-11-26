//
//  Exercise.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import Foundation //hello this is my contribution
import UIKit

struct Exercise: Codable {
    var name: String
    var instructionalVideo: String
    var directions: String
    var equipment: [String]
    var muscleGroups: [String]
    var difficulty: Int             // value from 1-5
    var commonMistakes: String
    var substitutions: String
    var icon: MuscleGroup
}

struct MyExercise: Codable {
    var exercise: Exercise
    var weight: Float
    var reps: Int
    var sets: Int
}
enum MuscleGroup: String, Codable {
    case hamstrings
    case glutes
    case quads
    case calves
    case hips
    case core
    case abductors
    case lowerBack
    case upperBack
}

