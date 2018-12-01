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
        
        if Workouts.count == 0 {    // populate with sample data
            let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
            guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
            do {
                let wo1 = try [JSONDecoder().decode(Workout.self, from: data)]
                let wo2 = Workout(title: "Second Workout", time: 0, exercises: wo1[0].exercises, difficulty: 1, tags: [], priv: false, numOfExercises: 0, sharedWith: [], description: "", icon: .upper)
                Workouts = [wo1[0], wo2]
            } catch let error{
                print("here")
                print(error.localizedDescription)
            }
        }
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
        newCell.favAdd.tag = indexPath.row
        newCell.favAdd.addTarget(self, action: #selector(addToFavs(sender:)), for: UIControlEvents.touchUpInside)
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(Workouts[indexPath.row].title)
        currentWorkout = indexPath.row
        let workoutVC = self.storyboard?.instantiateViewController(withIdentifier: "workoutDeets") as! FavoriteWorkoutVC
        workoutVC.workout = Workouts[indexPath.row]
        self.navigationController!.pushViewController(workoutVC, animated : true)
    }
    
    @objc func addToFavs(sender: UIButton){
        print(Workouts[sender.tag].title)
        writeNewWorkout(Workouts[sender.tag])
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FavoriteWorkoutVC {
            let vc = segue.destination as? FavoriteWorkoutVC
            vc?.workout = Workouts[currentWorkout]
        }
    }*/
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
