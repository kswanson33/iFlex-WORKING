//
//  FirebaseFunctions.swift
//  iFlex-WORKING
//
//  Created by labuser on 11/29/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//


import Firebase
import Foundation

func writeWorkoutToDatabase(_ workout: Workout) {
    // Access the "unicorns" child reference and then access (create) a unique child reference within it and finally set its value
    //let ref = Database.database().reference()
    /*
    //let workoutRef = ref.child("Workouts").child(workout.title)
    //let usersRef = ref.child("users").child("z@k.com")
    
    workoutRef.setValue(workout.toAnyObject())
    print("Start of Database function")
    for e in workout.exercises{
        workoutRef.child(e.exercise.name).setValue(e.exercise.toAnyObject())
        print(e.reps)
        //print(e.exercise.toAnyObject())
    }
 */
}
