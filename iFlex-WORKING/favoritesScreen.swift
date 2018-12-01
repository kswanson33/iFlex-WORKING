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

class favoritesScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let u = User(id: 10, favorites: [], userName: "User1")
        writeNewUser(u) //stores their favorites locally (should be async)
        // Do any additional setup after loading the view.
        //SET MYFAVES BY DOING LOCAL STUFF
        if myFaves == nil { // populate with sample data
            let path = Bundle.main.path(forResource: "full-workout", ofType: "txt")
            guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: []) else {return}
            do {
                let wo1 = try [JSONDecoder().decode(Workout.self, from: data)]
                myFaves = wo1
            } catch let error{
                print("here")
                print(error.localizedDescription)
            }
        }
        print("Look here")
        let ref = Database.database().reference(withPath: "Workouts")
        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any)
        })
    }

    var myFaves: [Workout]?
    
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

    @IBOutlet weak var theCollectionView: UICollectionView!


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

        cell.backgroundColor = UIColor.red
        if let myW = myFaves?[indexPath.row]{
            cell.title.text = myW.title
            var icon = myW.icon
            cell.workImage.image = workoutEnumToIcon(area: icon)

        }

        return cell

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate let itemsPerRow: CGFloat = 1

}
