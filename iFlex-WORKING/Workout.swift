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
    
    //Standard init
    init(title: String, time: Int,exercises: [MyExercise], difficulty: Int, tags: [String], priv: Bool, numOfExercises: Int, sharedWith: [String], description: String, icon: WorkoutTarget){
        self.title = title
        self.time = time
        self.exercises = exercises
        self.difficulty = difficulty
        self.tags = tags
        self.priv = priv
        self.numOfExercises = numOfExercises
        self.sharedWith = sharedWith
        self.description = description
        self.icon = icon
    }
    
    // Init for reading from Database snapshot
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        time  = snapshotValue["time "] as! Int
        exercises = snapshotValue["exercises"] as! [MyExercise]
        difficulty = snapshotValue["difficulty"] as! Int
        tags = snapshotValue["tags"] as! [String]
        priv = snapshotValue["priv"] as! Bool
        difficulty = snapshotValue["difficulty"] as! Int
        numOfExercises = snapshotValue["numOfExercises"] as! Int
        sharedWith = snapshotValue["sharedWith"] as! [String]
        description = snapshotValue["description"] as! String
        icon = snapshotValue["icon"] as! WorkoutTarget
    }
    
    // Func converting model for easier writing to database
    func toAnyObject() -> Any {
        return [
            "title" : title,
            "time" : time,
            //"exercises" : exercises,
            "difficulty" : difficulty,
            "tags" : tags,
            "priv" : priv,
            "numOfExercises" : numOfExercises,
            "sharedWith" : sharedWith,
            "description" : description,
            //"icon" : icon
        ]
    }

}




//enums too!!!! structs
enum WorkoutTarget: String, Codable {
    case Upper
    case Lower
    case Core
    case FullBody
}


func printWorkout(_ workout: Workout) {
    print("\tTitle: \(workout.title)")
    print("\t\tDifficulty: \(workout.difficulty)")
    print("\t\tDescription: \(workout.description)")
    print("\t\tTime: \(workout.time)")
    print("\t\tPrivate?: \(workout.priv)")
    print("\t\tWorkout Target: \(workout.icon)")
    print("\tExercises: ")
    for e in workout.exercises {
        printMyExercise(e)
    }
}


