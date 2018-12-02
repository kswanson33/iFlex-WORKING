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
    let ref = Database.database().reference()
    let workoutRef = ref.child("Workouts").child(workout.title)
    let currentUser = Auth.auth().currentUser
    let userRef = Database.database().reference(withPath: "users")
    if currentUser != nil
    {
    userRef.child((currentUser?.uid)!).child("myFavWorkouts").child(workout.title).setValue(workout.toAnyObject())
    }
    print("Start of Database function")
    for e in workout.exercises{
        workoutRef.child(e.exercise.name).setValue(e.exercise.toAnyObject())
        print(e.reps)
        //print(e.exercise.toAnyObject())
    }
}


func readWorkoutFromDatabase(_ workout: Workout) {
    let ref = Database.database().reference()
    let workoutRef = ref.child("Workouts").child(workout.title)
    let currentUser = Auth.auth().currentUser
    let userRef = Database.database().reference(withPath: "users")
    if currentUser != nil
    {
        userRef.child((currentUser?.uid)!).setValue(workout.toAnyObject())
    }
    print("Start of Database function")
    for e in workout.exercises{
        workoutRef.child(e.exercise.name).setValue(e.exercise.toAnyObject())
        print(e.reps)
        //print(e.exercise.toAnyObject())
    }
}
