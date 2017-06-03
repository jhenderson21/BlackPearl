//
//  BehaviorDefinitionViewController.swift
//  BlackPearl
//
//  Created by Jasen Henderson on 6/1/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit
import CoreData


class BehaviorDefinitionViewController: UIViewController {

    var behaviorToDisplay = ""
    var definitionToDisplay = ""
    
    @IBOutlet weak var behaviorLabel: UILabel!
    @IBOutlet weak var behaviorDefinitionTextBox: UITextView!
    
    @IBAction func saveBehavior(_ sender: Any) {
        
        
        
        
        performSegue(withIdentifier: "saveBehavior", sender: self)
        
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "saveBehavior" {
//        }
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        behaviorLabel.text = behaviorToDisplay
        behaviorDefinitionTextBox.text = definitionToDisplay
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        behaviorLabel.text = behaviorToDisplay
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
