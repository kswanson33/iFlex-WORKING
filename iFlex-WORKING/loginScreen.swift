//
//  loginScreen.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit

class loginScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = loadLocal() {
            // This has a bug - there is no nav controller
            /*let indVC = self.storyboard?.instantiateViewController(withIdentifier: "favoritesScreen") as! favoritesScreen
            self.navigationController!.pushViewController(indVC, animated : true)*/
        }
        print("hello")

        // Do any additional setup after loading the view.
        
        let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
        guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
        do {
            let wo1 = try [JSONDecoder().decode(Workout.self, from: data)]
            print ("problem yet")
            print(wo1[0].title)
            print(wo1[0].exercises[1].exercise.name)
            //HERE IS A WORKING WORKOUT LOADED IN FROM THE TEXT FILE ATTACHED PLEASE STORE THIS SOMEWHERE IF YOU WANT TO RUN TESTING
        } catch let error{
            print("here")
            print(error.localizedDescription)
        }
        
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
            let u = User(id: 20, favorites: [], userName: textField.text!)
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
