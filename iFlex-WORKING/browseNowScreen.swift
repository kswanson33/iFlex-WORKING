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
    
    let publicWorkoutsRef = Database.database().reference(withPath: "publicWorkouts/publicWorkouts")
    
    var Workouts: [Workout] = []
    @IBOutlet weak var workoutCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        // Populate with placeholder data
        Workouts = readLocalPublic()
        printWorkout(Workouts[0])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerCell", for: indexPath) as! exCell
        newCell.layer.cornerRadius = newCell.layer.frame.width/45
        newCell.title.text = Workouts[indexPath.row].title
        newCell.workImage.image = workoutEnumToIcon(area: Workouts[indexPath.row].icon)
        newCell.workImage.layer.cornerRadius = newCell.workImage.layer.frame.width/6
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
    
    @IBAction func addToFavs(_ sender: AnyObject) {
        let indexNum = sender.tag
        print(Workouts[indexNum!].title)
        writeToLocalFaves(Workouts[indexNum!])
        alert(title: "Success", message: "Added to favorites.")
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    
}

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
