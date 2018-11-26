//
//  CreateNewViewController.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

class CreateNewViewController: UIViewController {

    /* Updated by the fields in this view */
    var draftWorkout: Workout!
    
    /* Gets difficutly level from the user */
    @IBOutlet var difficultyLevel: UISegmentedControl!
    /* Toggles between public and private */
    @IBOutlet var publicToggle: UISwitch!
    /* Text field to get workout title */
    @IBOutlet var titleField: UITextField!
    /* Text field to get workout description */
    @IBOutlet var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draftWorkout = Workout(title: "", time: 0, exercises: [], difficulty: 0, tags: [], priv: true, numOfExercises: 0, sharedWith: [], description: "", icon: WorkoutTarget.upper)
        
        // Currently sets title, difficulty, private, description
        // TODO: Set time, icon, sharedWith, tags
        
        // Next view takes care of: exercises, number of exercises
    }
    
    /* Sets difficulty level of draftWorkout */
    @IBAction func setDifficulty(_ sender: Any) {
        print("Difficulty is: \(difficultyLevel.selectedSegmentIndex + 1)")
        draftWorkout.difficulty = difficultyLevel.selectedSegmentIndex + 1
    }
    
    /* Sets private to TRUE when off, to FALSE when on */
    @IBAction func publicToggleSwitched(_ sender: Any) {
        if (publicToggle.isOn) {
            draftWorkout.priv = false
        } else {
            draftWorkout.priv = true
        }
        print("Private is: \(draftWorkout.priv)")
    }

    /* Sets title of draft workout */
    @IBAction func setDraftWorkoutTitle(_ sender: Any) {
        // change this to update whenever field is modified?
        draftWorkout.title = titleField.text!
        //print(draftWorkout.title)
    }
    
    /* Sets draft workout description */
    @IBAction func setDescription(_ sender: Any) {
        draftWorkout.description = descriptionField.text!
        //print(draftWorkout.description)
    }
    
    
    /* Pass draft workout to AddExercises view */
    /* Source: https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/ */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddExercisesVC {
            let vc = segue.destination as? AddExercisesVC
            vc?.draftWorkout = self.draftWorkout
        }
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
