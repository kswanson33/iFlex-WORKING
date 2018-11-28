//
//  AddExercisesVC.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

class AddExercisesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var draftWorkout: Workout!  // passed in from prev. view
    var exercises: [MyExercise] = []
    var currentExercise = 0
    @IBOutlet var exercisesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
        /* Populate exercises -- TEMP */
        exercises = loadFromPublic()[0].exercises
    }
    
    /* Collection view setup */
    func setUpCollectionView() {
        exercisesCollectionView.dataSource = self
    }
    
    /* Set number of items in collection view */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exercises.count
    }
    
    /* Design collection view cell */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultExercise", for: indexPath) as! exCell
        newCell.title.text = exercises[indexPath.row].exercise.name
        newCell.workImage.image = #imageLiteral(resourceName: "icons8-prelum-50")
        return newCell
    }
    
    /* Action when collection view cell is clicked */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentExercise = indexPath.row
    }
    
    /* Uncomment when ExerciseDetailView exists */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.destination is ExerciseDetailView {
            let vc = segue.destination as? ExerciseDetailView
            vc?.theExercise = exercises[currentExercise]
        }*/
    }
    
    /* Write draft workout to user's favorites */
    @IBAction func saveButton(_ sender: Any) {
        writeNewWorkout(draftWorkout)
        let u = loadLocal()
        printUser(u!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
