//
//  loginScreen.swift
//  Storyboards
//
//  Created by Carla Beghin on 11/13/18.
//  Copyright © 2018 CSE438. All rights reserved.
//

import UIKit

class loginScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = loadLocal() {
            let indVC = self.storyboard?.instantiateViewController(withIdentifier: "favoritesScreen") as! favoritesScreen
            self.navigationController!.pushViewController(indVC, animated : true)
        }
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var newUserButton: UIButton!
    
    @IBAction func loginPressed(_ sender: Any) {
        print("Login pressed")
        if textField.text == "" {
            print("No username")
            alert(title: "Invalid Input", message: "Please enter a username")
            return
        }
        
        //check if we are able to connect to the database
        //do we want any validation on the text field
        if true { //if let u = returnUser(username) {
            let u = User(id: 20, favorites: [], userName: "User2")
            writeNewUser(u)
            /*let indVC = self.storyboard?.instantiateViewController(withIdentifier: "favoritesScreen") as! favoritesScreen
            self.navigationController!.pushViewController(indVC, animated : true)*/
        } else {
            print(textField.text!)
            alert(title: "Incorrect Username", message: "Check to make sure you spelled your username correctly or you are connected to wifi")
        }
    }
    
    func alert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    @IBAction func newUserPressed(_ sender: Any) {
        // Do not push new view onto nav controller. View already exists in storyboard, and nav controller does not exist. The transition to the next view is taken care of entirely in the storyboard.
        /*let indVC = self.storyboard?.instantiateViewController(withIdentifier: "newUserScreen") as! newUserScreen
        self.navigationController!.pushViewController(indVC, animated : true)*/
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
