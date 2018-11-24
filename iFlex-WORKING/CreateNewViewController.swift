//
//  CreateNewViewController.swift
//  mmm
//
//  Created by Kendra Swanson on 11/20/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draftWorkout = Workout(title: "", time: 0, exercises: [], difficulty: 0, tags: [], priv: true, numOfExercises: 0, sharedWith: [], description: "", icon: WorkoutTarget.upper)
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
        print(draftWorkout.title)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var setDraftWorkoutTitle: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
