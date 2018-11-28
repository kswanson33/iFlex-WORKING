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
    /* Text field to get time to complete */
    @IBOutlet var timeField: UITextField!
    /* Icon outlets */
    @IBOutlet var upperIcon: UIImageView!
    @IBOutlet var lowerIcon: UIImageView!
    @IBOutlet var coreIcon: UIImageView!
    @IBOutlet var fullBodyIcon: UIImageView!
    
    /* Tap gesture recognizer for icons */
    /* Source: https://stackoverflow.com/questions/29202882/how-do-you-make-an-uiimageview-on-the-storyboard-clickable-swift */
    @objc func upperTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("upper")
            draftWorkout.icon = .upper
        }
    }
    @objc func lowerTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("lower")
            draftWorkout.icon = .lower
        }
    }
    @objc func coreTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("core")
            draftWorkout.icon = .core
        }
    }
    @objc func fullBodyTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("full body")
            draftWorkout.icon = .fullBody
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draftWorkout = Workout(title: "", time: 0, exercises: [], difficulty: 0, tags: [], priv: true, numOfExercises: 0, sharedWith: [], description: "", icon: WorkoutTarget.upper)
        
        // Currently sets title, difficulty, private, description, time, icon
        // TODO: Set sharedWith, tags; validation; indicate which icon is currently selected; handle blank fields
        
        // Next view takes care of: exercises, number of exercises
        
        // create tap gesture recognizer
        let upperTapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewViewController.upperTapped(gesture:)))
        // add it to the image view
        upperIcon.addGestureRecognizer(upperTapGesture)
        // make sure imageView can be interacted with by user
        upperIcon.isUserInteractionEnabled = true
        // For lower:
        let lowerTapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewViewController.lowerTapped(gesture:)))
        lowerIcon.addGestureRecognizer(lowerTapGesture)
        lowerIcon.isUserInteractionEnabled = true
        // For core:
        let coreTapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewViewController.coreTapped(gesture:)))
        coreIcon.addGestureRecognizer(coreTapGesture)
        coreIcon.isUserInteractionEnabled = true
        // For full body:
        let fullBodyTapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateNewViewController.fullBodyTapped(gesture:)))
        fullBodyIcon.addGestureRecognizer(fullBodyTapGesture)
        fullBodyIcon.isUserInteractionEnabled = true
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
    }
    
    /* Sets draft workout description */
    @IBAction func setDescription(_ sender: Any) {
        draftWorkout.description = descriptionField.text!
    }
    
    /* Sets time to complete draft workout */
    @IBAction func setTime(_ sender: Any) {
        // Validation: is it an int?
        guard let temp_time = Int(timeField.text!) else {
            print("Invalid input")
            return
        }
        draftWorkout.time = temp_time
        print(draftWorkout.time)
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
