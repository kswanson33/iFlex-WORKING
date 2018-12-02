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

// TO BE IMPLEMENTED: THANKS ZAYID!!!

func writeWorkoutToFavorites(_ workout: Workout) {
    // Called in addToFavs function in browseNowScreen.swift
    // Should write a workout to the logged-in user's favorites.
}

func getUserByUsername(username: String) -> User {
    // Called in viewDidLoad() of favoritesScreen.swift -- needed to populate favorites collection view.
    // Retrieves and returns a user object.
    // Not sure how you want to do this. Just need some way of retrieving the Favorites data for whichever user is currently logged in. I leave it up to you to make changes to this function if you need to!
    return User(id: "", userName: "")   // placeholder; remove later
}

func updateFaveWorkout(_ workout: Workout) {
    // Called in confirmAction closure in alert() function of FavoriteWorkoutVC
    // Overwrites an existing workout in favorites -- called after one of the exercises in the workout is updated with user's personal data
    // Just for favorites: no public version of a workout should ever need to be updated
    // If you can find out a more efficient way to update an exercise than overwriting the whole workout, I'm all ears
}

func getDefaultWorkouts() -> [Workout] {
    // Called in viewDidLoad() of browseNowScreen.swift
    // Retrieves and returns all PUBLIC workouts as [Workout]
    return []       // placeholder
}
