//
//  favoritesScreen.swift
//  Storyboards
//
//  Created by Carla Beghin on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import UIKit
import Foundation

class favoritesScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let u = User(id: 10, favorites: [], userName: "User1")
        writeNewUser(u) //stores their favorites locally (should be async)
        // Do any additional setup after loading the view.
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
