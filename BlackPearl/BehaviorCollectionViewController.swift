//
//  BehaviorCollectionViewController.swift
//  BlackPearl
//
//  Created by Jasen on 6/1/17.
//  Copyright © 2017 otter. All rights reserved.
//
func feedbackTap() {
    let generator = UISelectionFeedbackGenerator()
    generator.prepare()
    generator.selectionChanged()
}

import UIKit
import CoreData

var replacementBehaviors : [NSManagedObject] = []
var targetBehaviors : [NSManagedObject] = []

private let reuseIdentifier = "Cell"

class BehaviorCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        var count = 0
        
        if isTarget == true {
            count = targetBehaviors.count
        } else if isTarget == false {
            count = replacementBehaviors.count
            }
        return count
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! BehaviorCollectionViewCell
    
        
        
        if isTarget == true {
            
            let behavior = targetBehaviors[indexPath.item]
            cell.behaviorNameLabel.text = behavior.value(forKey: "name") as? String
            cell.backgroundColor = targetColor
            
        }
        
        if isTarget == false {
            
            let behavior = replacementBehaviors[indexPath.item]
            cell.behaviorNameLabel.text = behavior.value(forKey: "name") as? String
            cell.backgroundColor = replacementColor
            
        }
        
        // Configure the cell
        cell.behaviorNameLabel.textColor = UIColor.white
        
        cell.layer.cornerRadius = 10
        return cell
    }
    var selectedBehavior = ""
    var selectedDefinition = ""
    
                
    
                
                
    


    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        feedbackTap()
        
        if isTarget == true {
        selectedBehavior = targetBehaviorArray[indexPath.item]
        selectedDefinition = targetBehaviorsDefinition[indexPath.item]
        }
        if isTarget == false {
            selectedBehavior = replacementBehaviorArray[indexPath.item]
            selectedDefinition = replacementBehaviorsDefinition[indexPath.item]
            
        }
        
        
        
        
        performSegue(withIdentifier: "toDefinitionPage", sender: self)
        
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDefinitionPage" {
            
            if let indexPath = self.collectionView?.indexPathsForSelectedItems {
                
                let controller = segue.destination as! BehaviorDefinitionViewController
                
                controller.behaviorToDisplay = selectedBehavior
                controller.definitionToDisplay = selectedDefinition
                
                
            }
        }
    }
    
    
}
