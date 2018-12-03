//
//  LocalDataFunctions.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import Foundation


//let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")

/* Writes a new user to local plist */
func localLogin(_ user: User) {
    // called on login
    //DispatchQueue.global(qos: .background).async {
    let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")
    let data = try! PropertyListEncoder().encode(user)
    NSKeyedArchiver.archiveRootObject(data, toFile: path!)
    //}
}

/* Load all local data. Expects local data to be either empty, or a single user. */
func loadLocalPersonal() -> User? {
    // Retrieve current array of workouts
    let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")
    // To make asynchonous, enclose in:
    //DispatchQueue.global(qos: .background).async {}
    guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as? Data else {
        return nil
    }
    let user = try! PropertyListDecoder().decode(User.self, from: data)
    return user
}

/* Get favorites */
func getFavoritesFromLocal() -> [Workout] {
    return loadLocalPersonal()!.favorites!
}

/* Writes an empty array to local plist root object */
func clearLocal() {
    // called on logout
    let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")
    NSKeyedArchiver.archiveRootObject([], toFile: path!)
}

/* Adds a workout to the user's favorites */
func writeToLocalFaves(_ workout: Workout) {
    // retrieve data
    let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")
    guard var user = loadLocalPersonal() else {
        print("Cannot write workout to user who doesn't exist.")
        return
    }
    // check that workout is not already present before appending
    var workouts = user.favorites!
    if workouts.contains(where: {$0.title == workout.title}) {
        print("\(workout.title) already in favorites")
    } else {
        workouts.append(workout)
        print("Wrote \(workout.title) to favorites")
    }
    user.favorites = workouts
    
    let data = try! PropertyListEncoder().encode(user)
    NSKeyedArchiver.archiveRootObject(data, toFile: path!)
}

/* Overwrites workouts */
func overwriteLocalFavorites(workouts: [Workout]) {
    // retrieve data
    let path = Bundle.main.path(forResource: "Favorites", ofType: "plist")
    guard var user = loadLocalPersonal() else {
        print("Cannot write workout to user who doesn't exist.")
        return
    }
    user.favorites = workouts
    let data = try! PropertyListEncoder().encode(user)
    NSKeyedArchiver.archiveRootObject(data, toFile: path!)
}

func writeToLocalPublic() {
    let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
    guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {
        print("couldn't decode full-workout")
        return
    }
    let wo1 = try! JSONDecoder().decode([Workout].self, from: data)
    printWorkout(wo1[0])
    let data2 = try! PropertyListEncoder().encode(wo1)
    let path2 = Bundle.main.path(forResource: "PublicWorkouts", ofType: "plist")
    NSKeyedArchiver.archiveRootObject(data2, toFile: path2!)
}

func readLocalPublic() -> [Workout] {
    let path = Bundle.main.path(forResource: "PublicWorkouts", ofType: "plist")
    // To make asynchonous, enclose in:
    //DispatchQueue.global(qos: .background).async {}
    guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as? Data else {
        return []
    }
    let workouts = try! PropertyListDecoder().decode([Workout].self, from: data)
    return workouts
}

func writeToLocalPublic(_ w: Workout) {
    let path = Bundle.main.path(forResource: "PublicWorkouts", ofType: "plist")
    var workouts = readLocalPublic()
    workouts.append(w)
    let data = try! PropertyListEncoder().encode(workouts)
    NSKeyedArchiver.archiveRootObject(data, toFile: path!)
}
