//
//  UsefulFunctions.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson on 11/28/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//

import Foundation
import UIKit

func workoutEnumToIcon(area: WorkoutTarget) -> UIImage {
    switch area {
    case .Upper:
        return #imageLiteral(resourceName: "icons8-chest-50")
    case .Lower:
        return #imageLiteral(resourceName: "icons8-calves-50")
    case .Core:
        return #imageLiteral(resourceName: "icons8-prelum-50")
    case .FullBody:
        return #imageLiteral(resourceName: "icons8-weightlifting-filled-50")
    }
}

func exerciseEnumToIcon(area: MuscleGroup) -> UIImage {
    switch area {
    case .Abductors:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .Calves:
        return #imageLiteral(resourceName: "icons8-calves-50")
    case .Core:
        return #imageLiteral(resourceName: "icons8-prelum-50")
    case .Glutes:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .Hamstrings:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .Hips:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .LowerBack:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .Quads:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .UpperBack:
        return #imageLiteral(resourceName: "icons8-torso-50")
    }
}

