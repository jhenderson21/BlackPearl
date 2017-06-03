//
//  StudentDetailViewController.swift
//  BlackPearl
//
//  Created by Jasen on 5/31/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    
    
    
    
    
    @IBAction func unwindToStudentDetail(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradelabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    
    @IBAction func tapImageAction(_ sender: Any) {
        performSegue(withIdentifier: "editStudent", sender: self)
    }
    
    
    var selectedName = ""
    var selectedGrade = ""
    var selectedPeriod = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedName
        gradelabel.text = selectedGrade
        periodLabel.text = selectedPeriod
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameLabel.text = selectedName
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        nameLabel.text = selectedName
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editStudent" {
            let destination = segue.destination as? EditStudentViewController
            destination?.nameLabelText = nameLabel.text!
            destination?.gradeLabelText = gradelabel.text!
            
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
