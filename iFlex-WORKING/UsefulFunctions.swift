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
    case .upper:
        return #imageLiteral(resourceName: "icons8-chest-50")
    case .lower:
        return #imageLiteral(resourceName: "icons8-calves-50")
    case .core:
        return #imageLiteral(resourceName: "icons8-prelum-50")
    case .fullBody:
        return #imageLiteral(resourceName: "icons8-weightlifting-filled-50")
    }
}

func exerciseEnumToIcon(area: MuscleGroup) -> UIImage {
    switch area {
    case .abductors:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .calves:
        return #imageLiteral(resourceName: "icons8-calves-50")
    case .core:
        return #imageLiteral(resourceName: "icons8-prelum-50")
    case .glutes:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .hamstrings:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .hips:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .lowerBack:
        return #imageLiteral(resourceName: "icons8-torso-50")
    case .quads:
        return #imageLiteral(resourceName: "icons8-leg-50")
    case .upperBack:
        return #imageLiteral(resourceName: "icons8-torso-50")
    }
}

