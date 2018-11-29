//
//  FirebaseFunctions.swift
//  iFlex-WORKING
//
//  Created by labuser on 11/29/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//

import Foundation
import Firebase

func writeWorkoutToDatabase(_ Workout: Workout) {
    // Access the "unicorns" child reference and then access (create) a unique child reference within it and finally set its value
    let ref = Database.database().reference()
    let workoutRef = ref.child("Workouts").child(Workout.title)
    workoutRef.setValue(Workout.toAnyObject())
    print("Start of Database function")
    for e in Workout.exercises{
         workoutRef.child(e.exercise.name).setValue(e.exercise.toAnyObject())
        print(e.re)
        //print(e.exercise.toAnyObject())
    }
}
