//
//  SecondScreen.swift
//  ExercisesCollectionTableView
//
//  Created by labuser on 11/23/18.
//  Copyright © 2018 Benji Gu. All rights reserved.
//

import Foundation
import UIKit

class WorkoutDetailView: UIViewController{
    
    var theWorkout: Workout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        printWorkout(theWorkout)
        //let imageFrame = CGRect(x: view.frame.midX - (workoutImage?.size.width)!/2, y: 80, width: (workoutImage?.size.width)!, height: (workoutImage?.size.height)!)
        //let imageView = UIImageView(frame: imageFrame)
        //imageView.image = workoutImage
        
        /*let titleTextFrame = CGRect(x: 0, y: (workoutImage?.size.height)! + 80, width: view.frame.width, height: 30  )
        let releaseDateTextFrame = CGRect(x: 0, y: (workoutImage?.size.height)! + 100, width: view.frame.width, height: 30  )
        let votesTextFrame = CGRect(x: 0, y: (workoutImage?.size.height)! + 120, width: view.frame.width, height: 30  )
        let overViewTextFrame = CGRect(x: 0, y: (workoutImage?.size.height)! + 140, width: view.frame.width, height: 30  )
        let titleView = UILabel(frame: titleTextFrame)
        titleView.text = name
        let releaseView = UILabel(frame: releaseDateTextFrame)
        releaseView.text = String(time)
        let voteView = UILabel(frame: votesTextFrame)*/
        
    }
}
