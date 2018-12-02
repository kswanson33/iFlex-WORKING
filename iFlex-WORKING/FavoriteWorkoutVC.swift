//
//  FavoriteWorkoutVC.swift
//  iFlex-WORKING
//
//  Created by Christina Stellwagen on 11/29/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//

import Foundation
import UIKit

class FavoriteWorkoutVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    var workout: Workout?
    @IBOutlet var workoutTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        workoutTitle.text = workout?.title
        approxTime.text = String(workout!.time)
        var icon = workout?.icon
        icons.image = workoutEnumToIcon(area: icon!)
        var diff = workout?.difficulty
        var color: UIColor
        if diff! < 3 {
            color = UIColor.green
        }
        else if (diff! < 4) {
            color = UIColor.yellow
        }
        else {
            color = UIColor.red
        }
        icons.backgroundColor = color
        var st = workout?.tags[0]
        tags.text = st
        putDescription.text = workout?.description
    }
    
    @IBOutlet weak var approxTime: UILabel!
    
    
    @IBOutlet weak var icons: UIImageView!
    
    @IBOutlet weak var putDescription: UILabel!
    
    @IBOutlet weak var tags: UILabel!
    
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let numResults = (workout?.exercises.count)
        {
            
            if numResults > indexPath.row
            {
                
                if let ex = workout?.exercises[indexPath.row]{
                    print(ex)
                    print("!!!")
                    //let indVC = IndividualMovieController()
                    let indVC = self.storyboard?.instantiateViewController(withIdentifier: "exerciseWOW") as! ExerciseVC
                    indVC.exercise = ex
                    self.navigationController!.pushViewController(indVC, animated : true)
                    
                }
            }
            
        }
        return false
    }
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    //fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numResults = (workout?.exercises.count)
        {
            return numResults
        }
        else
        {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! WorkoutCell
        
      //  cell.backgroundColor = UIColor.red
        if let myEx = workout?.exercises[indexPath.row]{
            cell.cellLabel.text = myEx.exercise.name
            cell.setsNum.text = String(myEx.sets)
            cell.repsNum.text = String(myEx.reps)
            cell.weightNum.text = String(myEx.weight)
            var icon = myEx.exercise.icon
            cell.Icon.image = exerciseEnumToIcon(area: icon)
            cell.addData.tag = indexPath.row
            cell.addData.addTarget(self, action: #selector(addUserData), for: UIControlEvents.touchUpInside)
            
        }
        
        return cell
        
    }
    
    @IBAction func addUserData(sender: AnyObject) -> Void {
        var indexPathRow = sender.tag
        if let myEx = workout?.exercises[indexPathRow!]{
            print(myEx.exercise.name)
            alert(title: myEx.exercise.name, message: "Please add your sets, reps, and weight below", index: indexPathRow!)
        }
    }
    func alert(title: String, message: String, index: Int)
    { //used www.simplifiedios.net/ios-dialog-box-with-input/
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad; textField.placeholder = "Enter Sets"
        }
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad; textField.placeholder = "Enter Reps"
        }
        alert.addTextField { (textField) in
            textField.keyboardType = .decimalPad; textField.placeholder = "Enter Weight"
        }
        
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let userSets = alert.textFields?[0].text
            let userReps = alert.textFields?[1].text
            let userWeight = alert.textFields?[2].text
            
            if let sets = Int(userSets!) {
                self.workout?.exercises[index].sets = sets
            }
            if let reps = Int(userReps!) {
                self.workout?.exercises[index].reps = reps
            }
            if let weight = Float(userWeight!) {
                self.workout?.exercises[index].weight = weight
            }
            self.theCollectionView.reloadData()
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate let itemsPerRow: CGFloat = 1
    
    
    
    
}
