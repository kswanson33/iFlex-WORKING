//
//  AddExercisesVC.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

class AddExercisesVC: UIViewController {
    
    var draftWorkout: Workout!  // passed in from prev. view

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print(draftWorkout)
    }
    
    /* REMOVE LATER */
    @IBAction func TEMP_BUTTON(_ sender: Any) {
        let exercise1 = Exercise(name: "E1", instructionalVideo: "", directions: "", equipment: [], muscleGroups: [], difficulty: 1, commonMistakes: "", substitutions: "", icon: MuscleGroup.calves)
        let myExercise1 = MyExercise(exercise: exercise1, weight: 1000, reps: 1000, sets: 0)
        draftWorkout.exercises.append(myExercise1)
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
