//
//  Exercise.swift
//  iFlex
//
//  Created by Kendra Swanson on 11/1/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Benjamin Gu. All rights reserved.
//

import Foundation
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

