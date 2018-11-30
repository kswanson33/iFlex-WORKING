//
//  browseNowScreen.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

class browseNowScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var Workouts: [Workout] = []
    var currentWorkout: Int = 0
    @IBOutlet weak var workoutCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let Wrkout1 = Workout(title: "A", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)
        let Wrkout2 = Workout(title: "B", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)*/
        //Workouts = [Wrkout1, Wrkout2]
        
        Workouts = loadLocal()!.favorites! // delete this and uncomment the line below when that function exists
        //Workouts = loadFromDatabase()
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerCell", for: indexPath) as! exCell
        newCell.title.text = Workouts[indexPath.row].title
        newCell.workImage.image = workoutEnumToIcon(area: Workouts[indexPath.row].icon)
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(Workouts[indexPath.row].title)
        currentWorkout = indexPath.row
    }
    
    func addToFavs(sender: UIButton){
        print("adding?")
        writeNewWorkout(Workouts[currentWorkout])
        print("added?")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FavoriteWorkoutVC {
            let vc = segue.destination as? FavoriteWorkoutVC
            vc?.workout = Workouts[currentWorkout]
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
