//
//  CreateNewViewController.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

// Currently sets title, difficulty, private, description, time, icon. Description text now wraps around. Icon now shows when it is selected.
// TODO: Set sharedWith, tags; validation; handle blank fields

class CreateNewViewController: UIViewController, UITextViewDelegate {

    /* Updated by the fields in this view */
    var draftWorkout: Workout!
    
    /* Gets difficutly level from the user */
    @IBOutlet var difficultyLevel: UISegmentedControl!
    /* Toggles between public and private */
    @IBOutlet var publicToggle: UISwitch!
    /* Text field to get workout title */
    @IBOutlet var titleField: UITextField!
    /* Text view to get workout description */
    //@IBOutlet var descriptionField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    /* Text field to get time to complete */
    @IBOutlet var timeField: UITextField!
    /* Icon outlets */
    @IBOutlet var upperIcon: UIImageView!
    @IBOutlet var lowerIcon: UIImageView!
    @IBOutlet var coreIcon: UIImageView!
    @IBOutlet var fullBodyIcon: UIImageView!
    
    /* Tap gesture recognizers for icons */
    /* Source: https://stackoverflow.com/questions/29202882/how-do-you-make-an-uiimageview-on-the-storyboard-clickable-swift */
    @objc func upperTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("upper")
            draftWorkout.icon = .upper
            showIconSelected(upperIcon)
        }
    }
    @objc func lowerTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("lower")
            draftWorkout.icon = .lower
            showIconSelected(lowerIcon)
        }
    }
    @objc func coreTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("core")
            draftWorkout.icon = .core
            showIconSelected(coreIcon)
        }
    }
    @objc func fullBodyTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("full body")
            draftWorkout.icon = .fullBody
            showIconSelected(fullBodyIcon)
        }
    }
    
    func showIconSelected(_ icon: UIImageView) {
        // View that appears over icon when it is selected
        let selected = CGRect(x: 0, y: 0, width: upperIcon.frame.width, height: upperIcon.frame.height)
        let selectedView = UIView(frame: selected)
        selectedView.backgroundColor = .blue
        selectedView.alpha = 0.2
        selectedView.tag = 101
        
        // Deselect any currently selected view
        /* Source: https://stackoverflow.com/questions/28197079/swift-addsubview-and-remove-it */
        for v in upperIcon.subviews {
            if v.tag == 101 {
                v.removeFromSuperview()
            }
        }
        for v in lowerIcon.subviews {
            if v.tag == 101 {
                v.removeFromSuperview()
            }
        }
        for v in coreIcon.subviews {
            if v.tag == 101 {
                v.removeFromSuperview()
            }
        }
        for v in fullBodyIcon.subviews {
            if v.tag == 101 {
                v.removeFromSuperview()
            }
        }
        
        // Select current icon
        icon.addSubview(selectedView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.delegate = self
        draftWorkout = Workout(title: "", time: 0, exercises: [], difficulty: 0, tags: [], priv: true, numOfExercises: 0, sharedWith: [], description: "", icon: WorkoutTarget.upper)
        showIconSelected(upperIcon)
        
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
    
    /* Action for text view receiving description */
    func textViewDidChange(_ textView: UITextView) {
        draftWorkout.description = descriptionTextView.text!
        //print(draftWorkout.description)
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
