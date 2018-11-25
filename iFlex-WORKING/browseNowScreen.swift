//
//  browseNowScreen.swift
//  Storyboards
//
//  Created by Carla Beghin on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import UIKit

class browseNowScreen: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return Workouts.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "exerCell", for: indexPath) as! exCell
            
            
            newCell.title.text = Workouts[indexPath.row].title
            
            
            
            return newCell
        }
        
        
        var Workouts: [Workout] = []
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            var Wrkout1 = Workout(title: "A", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)
            var Wrkout2 = Workout(title: "B", time: 0, exercises: [], difficulty: 1, tags: [], priv: false, numOfExercises: 5, sharedWith: [], description: "hello", icon: WorkoutTarget.core)
            Workouts = [Wrkout1, Wrkout2]
            workoutCollection.delegate = self
            workoutCollection.dataSource = self
            //        WorkoutTable.register(UITableViewCell.self, forCellReuseIdentifier: "exerCell")
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    @IBOutlet weak var workoutCollection: UICollectionView!
    
        
    }

    //add second screen that takes in data, and fetch local data to populate cells use loadlocal to get local data, add to favorites
