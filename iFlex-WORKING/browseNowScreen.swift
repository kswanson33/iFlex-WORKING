//
//  browseNowScreen.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit
import Firebase

class browseNowScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    let publicWorkoutsRef = Database.database().reference(withPath: "Workouts")
    
    var Workouts: [Workout] = []
    @IBOutlet weak var workoutCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        Workouts = getDefaultWorkouts()
        
        /* Populate with sample data -- comment out when getDefaultWorkouts works */
        
        /*
        if Workouts.count == 0 {
            let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
            guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
            do {
                let wo1 = try [JSONDecoder().decode(Workout.self, from: data)]
                let Wrkout2 = Workout(title: "B", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.Core)
                Workouts = wo1
                Workouts.append(Wrkout2)
            } catch let error{
                print("here")
                print(error.localizedDescription)
            }
        }*/
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerCell", for: indexPath) as! exCell
        newCell.title.text = Workouts[indexPath.row].title
        newCell.workImage.image = workoutEnumToIcon(area: Workouts[indexPath.row].icon)
        newCell.favAdd.tag = indexPath.row
        newCell.favAdd.addTarget(self, action: #selector(addToFavs), for: UIControlEvents.touchUpInside)
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(Workouts[indexPath.row].title)
        let wrkVC = self.storyboard?.instantiateViewController(withIdentifier: "workoutDeets") as! FavoriteWorkoutVC
        let currWrkout = Workouts[indexPath.row]
        wrkVC.workout = currWrkout
        self.navigationController!.pushViewController(wrkVC, animated: true)
    }
    
    // Doesn't work yet -- will work when writeWorkoutToFavorites is implemented!
    @IBAction func addToFavs(_ sender: AnyObject) {
        let indexNum = sender.tag
        print(Workouts[indexNum!].title)
        writeWorkoutToFavorites(Workouts[indexNum!])
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
}

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
