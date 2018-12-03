//
//  newUserScreen.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//
import UIKit
import Firebase

class newUserScreen: UIViewController {
    let loginToList = "LoginToList"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var createButton: UIButton!
    
    
    @IBAction func createButtonPressed(_ sender: Any) {
        localLogin(User(id: "", userName: ""))
        if (userField.text!.count) > 0 {
            
            Auth.auth().createUser(withEmail: userField.text!, password: "passWord"){
                user, error in
                if error == nil {
                    //let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                    //let indVC = storyboard.instantiateViewController(withIdentifier: "favoritesScreen")
                    //self.present(indVC, animated : true)
                    
                    
                    /* ADD TO USERS */
                    
                    
                    
                    self.performSegue(withIdentifier: "toFavs", sender: nil)
                }
                else if error != nil {
                    if let errorCode = AuthErrorCode(rawValue: error!._code){
                        switch errorCode{
                        case .emailAlreadyInUse:
                            self.alert(title: "Email is already in use", message: "Please try a different email.")
                            self.alert(title: "Invalid input", message: "Please try a different email.")
                        default:
                            self.alert(title: "Error", message: "There is an error.")
                        }
                    }
                    print(error?.localizedDescription)
                }
                if user != nil {
                    user?.user.sendEmailVerification() {
                        error in
                        print(error?.localizedDescription)
                    }
                }
            }
        }
        else {
            self.alert(title: "Invalid Input", message: "Please try typing something in.")
        }
        /*
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
         } */
    }
    
    
    
    func alert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        print(self)
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
