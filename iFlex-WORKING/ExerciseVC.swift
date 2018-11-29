//
//  ExerciseVC.swift
//  iFlex-WORKING
//
//  Created by Christina Stellwagen on 11/29/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//

import Foundation
import UIKit

class ExerciseVC: UIViewController{
    
    var exercise: MyExercise?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var iconImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let e = exercise {
            label.text = e.exercise.name
            iconImage.image = exerciseEnumToIcon(area: e.exercise.icon)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
