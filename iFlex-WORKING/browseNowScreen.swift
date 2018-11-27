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

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let Wrkout1 = Workout(title: "A", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)
        let Wrkout2 = Workout(title: "B", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)*/
        //Workouts = [Wrkout1, Wrkout2]
        Workouts = loadLocal()!.favorites! // load from remote
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        // WorkoutTable.register(UITableViewCell.self, forCellReuseIdentifier: "exerCell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerCell", for: indexPath) as! exCell
        newCell.title.text = Workouts[indexPath.row].title
        return newCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let secondView = WorkoutDetailView()
        print(Workouts[indexPath.row].title)
        currentWorkout = indexPath.row
        //secondView.name = Workouts[indexPath.row].title
        //secondView.time = Workouts[indexPath.row].time
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is WorkoutDetailView {
            let vc = segue.destination as? WorkoutDetailView
            //vc?.draftWorkout = self.draftWorkout
            //vc.name = Workouts
            vc?.theWorkout = Workouts[currentWorkout]
        }
    }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    @IBOutlet weak var workoutCollection: UICollectionView!
    
        
    }

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
