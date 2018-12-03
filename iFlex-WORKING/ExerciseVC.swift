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
    
    @IBOutlet weak var desc: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var iconImage: UIImageView!
    @IBOutlet weak var mistakes: UILabel!
    @IBOutlet weak var equip: UILabel!
    @IBOutlet weak var dif: UILabel!
    @IBOutlet weak var mc: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let e = exercise {
            label.text = e.exercise.name
            iconImage.image = exerciseEnumToIcon(area: e.exercise.icon)
            iconImage.layer.cornerRadius = iconImage.layer.frame.width/6
            desc.text = String(e.exercise.directions)
            mistakes.text = e.exercise.commonMistakes
            for eq in e.exercise.equipment {
                if e.exercise.equipment.index(of: eq)==e.exercise.equipment.endIndex-1 {
                     equip.text?.append(eq + " ")
                }
                else {
                    equip.text?.append(eq + ", ")
                }
                
            }
            dif.text = String(e.exercise.difficulty)
            for m in e.exercise.muscleGroups {
                mc.text?.append(m + "   ")
            }
            getVideo(code: e.exercise.instructionalVideo)
        }
    }
    func getVideo(code: String) {
        let url = URL(string: "https://www.youtube.com/embed/\(code)")
        webView.loadRequest(URLRequest(url: url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
