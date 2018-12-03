//
//  profileScreen.swift
//  iFlex-WORKING
//
//  Created by labuser on 11/30/18.
//  Copyright © 2018 Kendra Swanson. All rights reserved.
//
import UIKit
import Firebase

class profileScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userWeight: UILabel!
    @IBOutlet weak var userHeight: UILabel!
    @IBOutlet weak var userAge: UILabel!
    
    @IBOutlet weak var updateButton: UIButton!
    @IBAction func updateUser(_ sender: Any) {
        let alert = UIAlertController(title: "Update",
                                      message: "Update Account",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            var tf = [false, false, false, false, false]
            var trues = false
            if alert.textFields![0].text! != "" {
                self.userName.text = alert.textFields![0].text!
            }
            else {
                tf[0] = true
                trues = true
            }
            
            if let w = Int(alert.textFields![1].text!) {
                self.userWeight.text = "\(w) lbs"
            }
            else {
                tf[1] = true
                trues = true
            }
            if let f = Int(alert.textFields![2].text!) {
                if let i = Int(alert.textFields![3].text!) {
                    self.userHeight.text = "\(f) ft \(i) in"
                }
                else
                {
                    tf[3] = true
                    trues = true
                }
            }
            else {
                tf[2] = true
                trues = true
                if Int(alert.textFields![3].text!) == nil {
                    tf[3] = true
                    trues = true
                }
                
            }
            if let a = Int(alert.textFields![4].text!) {
                self.userAge.text = String(a)
            }
            else {
                tf[4] = true
                trues = true
            }
            if trues {
                self.alertz(title: "The following fields were empty or in the wrong format and were not updated:", message: "",tfArray: tf)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField { textName in
            textName.placeholder = "Enter username"
        }
        
        alert.addTextField { textWeight in
            textWeight.placeholder = "Enter weight in pounds"
        }
        alert.addTextField { textHeight in
            textHeight.placeholder = "Enter height in feet"
        }
        alert.addTextField { textHeight in
            textHeight.placeholder = "Enter height in inches"
        }
        alert.addTextField { textAge in
            textAge.placeholder = "Enter age"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    func alertz(title: String, message: String, tfArray: [Bool])
    {
        var messageN = message
        if tfArray[0] {
            messageN = "\(messageN)username "
        }
        if tfArray[1] {
            messageN = "\(messageN)weight "
        }
        if tfArray[2] {
            messageN = "\(messageN)height (feet) "
        }
        if tfArray[3] {
            messageN = "\(messageN)height (inches) "
        }
        if tfArray[4] {
            messageN = "\(messageN)age "
        }
        let alert = UIAlertController(title: title, message: messageN, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        // 1
        let user = Auth.auth().currentUser!
        
        let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
        
        
        onlineRef.removeValue { (error, _) in
            
            // 3
            if let error = error {
                print("Removing online failed: \(error)")
                return
            }
            
            // 4
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch (let error) {
                print("Auth sign out failed: \(error)")
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let indVC = storyboard.instantiateViewController(withIdentifier: "loginScreen")
            self.present(indVC, animated : true)
        }
        
        
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
