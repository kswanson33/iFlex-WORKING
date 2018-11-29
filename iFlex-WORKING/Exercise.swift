//
//  Exercise.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import Foundation //hello this is my contribution
import UIKit
import Firebase


// Struct for Exercise
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
    
    //Standard init
    init(name: String, instructionalVideo: String, directions: String, equipment: [String], muscleGroups: [String], difficulty: Int, commonMistakes: String, substitutions: String, icon: MuscleGroup){
        self.name = name
        self.instructionalVideo = instructionalVideo
        self.directions = directions
        self.equipment = equipment
        self.muscleGroups = muscleGroups
        self.difficulty = difficulty
        self.commonMistakes = commonMistakes
        self.substitutions = substitutions
        self.icon = icon
}
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        instructionalVideo = snapshotValue["instructionalVideo"] as! String
        directions = snapshotValue["directions"] as! String
        equipment = snapshotValue["equipment"] as! [String]
        muscleGroups = snapshotValue["muscleGroups"] as! [String]
        difficulty = snapshotValue["difficulty"] as! Int
        commonMistakes = snapshotValue["commonMistakes"] as! String
        substitutions = snapshotValue["substitutions"] as! String
        icon = snapshotValue["icon"] as! MuscleGroup
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            //"name" : name,
            "instructionalVideo" : instructionalVideo,
            "directions" : directions,
            "equipment" : equipment,
            "muscleGroups" : muscleGroups,
            "difficulty" : difficulty,
            "commonMistakes" : commonMistakes,
            "substitutions" : substitutions,
            //"icon" : icon
        ]
            
        
    }

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

// Struct for MyExercise
struct MyExercise: Codable {
    var exercise: Exercise
    var weight: Float
    var reps: Int
    var sets: Int
    
    //Standard init
    init(exercise: Exercise, weight: Float, reps: Int, sets: Int){
    self.exercise = exercise
    self.weight = weight
    self.reps = reps
    self.sets = sets
    }
    
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        exercise = snapshotValue["exercise"] as! Exercise
        weight = snapshotValue["weight"] as! Float
        reps = snapshotValue["reps"] as! Int
        sets = snapshotValue["sets"] as! Int
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            "weight" : weight,
            "reps" : reps,
            "sets" : sets
        ]
    }
}




    
func printMyExercise(_ e: MyExercise) {
    print("\t\tName: \(e.exercise.name)")
    print("\t\t\tDifficulty: \(e.exercise.difficulty)")
    //print("\t\t\tDescription: \(e.exercise.directions)")
}

