//
//  favoritesScreen.swift
//  iFlex-WORKING
//
//  Created by Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu on 11/26/18.
//  Copyright © 2018 Kendra Swanson, Christina Stellwagen, Carla Beghin, Zayid Oyelami, Benji Gu. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class favoritesScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var user: User!
    let currentUser = Auth.auth().currentUser
    let publicWorkoutsRef = Database.database().reference(withPath: "Workouts")
    let uRef = Database.database().reference(withPath: "users")
    let usersRef = Database.database().reference(withPath: "online")
    var myFaves: [Workout]?
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        print("LOOK HERE")
        
        publicWorkoutsRef.observe(.value, with: {
            snapshot in
                print(snapshot.value as Any)
        })
 
        //let u = User(id: 10, favorites: [], userName: "User1")
        //writeNewUser(u) //stores their favorites locally (should be async)
        // Do any additional setup after loading the view.
        //SET MYFAVES BY DOING LOCAL STUFF
        /*
            let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
            guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
            do {
                let wo1 = try [JSONDecoder().decode(Workout.self, from: data)]
                myFaves = wo1
            } catch let error{
                print("here")
                print(error.localizedDescription)
            }
 */
        
        user = getUserByUsername(username: "TheUser")
        myFaves = user.favorites
        
        /* Populate sample data -- delete when myFaves is set with a working Firebase function */
        let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
        guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
        do {
            let wo1 = try JSONDecoder().decode([Workout].self, from: data)
            myFaves = wo1
        } catch let error{
            print("here")
            print(error.localizedDescription)
        }
//        print("Look here")
//        let ref = Database.database().reference(withPath: "Workouts")

        Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = User(authData: user)
            
            let currentUserRef = self.usersRef.child(self.user.id)
            currentUserRef.setValue(self.user.userName)
            currentUserRef.onDisconnectRemoveValue()
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if let numResults = (myFaves?.count)
        {

            if numResults > indexPath.row
            {

                if let wo = myFaves?[indexPath.row]{

                    //let indVC = IndividualMovieController()
                    let indVC = self.storyboard?.instantiateViewController(withIdentifier: "workoutDeets") as! FavoriteWorkoutVC
                    indVC.workout = wo
                    self.navigationController!.pushViewController(indVC, animated : true)

                }
            }

        }
        return false
    }

    


    //fileprivate let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numResults = (myFaves?.count)
        {
            return numResults
        }
        else
        {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "faveCell", for: indexPath) as! exCell

      //  cell.backgroundColor = UIColor.red
        cell.layer.cornerRadius = cell.layer.frame.width/45
        if let myW = myFaves?[indexPath.row]{
            cell.title.text = myW.title
            cell.favAdd.tag = indexPath.row
            cell.favAdd.addTarget(self, action: #selector(deleteFromFaves), for: UIControlEvents.touchUpInside)
            let icon = myW.icon
            cell.workImage.image = workoutEnumToIcon(area: icon)
            cell.workImage.layer.cornerRadius = cell.workImage.layer.frame.width/6

        }
        return cell
    }
    
    @IBAction func deleteFromFaves(sender: AnyObject) -> Void {
        let indexPathRow = sender.tag
        if let myW = myFaves?[indexPathRow!]{
            alert(title: myW.title, message: "Selected workout was deleted")
            myFaves?.remove(at: indexPathRow!)
        }
        theCollectionView.reloadData()
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
    fileprivate let itemsPerRow: CGFloat = 1

}
