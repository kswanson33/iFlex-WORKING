//
//  newUserScreen.swift
//  Storyboards
//
//  Created by Carla Beghin on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import UIKit

class newUserScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    
    @IBAction func createButtonPressed(_ sender: Any) {
        if let username = textField.text {
            //check if we are able to connect to the database
            //do we want any validation on the text field
            if false {    //returnUser(username) {
                alert(title: "Existing Username", message: "Username already exists.")
            }
            else{
                //make new user and put it firebase and locally
                var newU = User(id: nil, favorites: nil, userName: username)    // temporary code to make this build, remove when if statement above is uncommented
                //var t = initUser(newU)
                newU.id = 10 //t
                writeNewUser(newU) //stores data locally
                /*let indVC = self.storyboard?.instantiateViewController(withIdentifier: "favoritesScreen") as! favoritesScreen
                self.navigationController!.pushViewController(indVC, animated : true)*/
            }
            
        }
        else{
            alert(title: "Invalid Input", message: "Please enter a username")
        }
    }
    
    
    
    func alert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true)
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
