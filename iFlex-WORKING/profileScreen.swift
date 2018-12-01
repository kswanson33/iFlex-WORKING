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
            
            self.userName.text = alert.textFields![0].text
            self.userWeight.text = alert.textFields![1].text
            self.userHeight.text = alert.textFields![2].text
            self.userAge.text = alert.textFields![3].text
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        
        alert.addTextField { textName in
            textName.placeholder = "Enter your full name"
        }
        
        alert.addTextField { textWeight in
            textWeight.placeholder = "Enter your current weight"
        }
        alert.addTextField { textHeight in
            textHeight.placeholder = "Enter your current weight"
        }
        alert.addTextField { textAge in
            textAge.placeholder = "Enter your current age"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    @IBAction func logOut(_ sender: Any) {
        
        // 1
        let user = Auth.auth().currentUser!
        
        //let onlineRef = Database.database().reference(withPath: "online/\(user.uid)")
        
        /*
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
         */
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
