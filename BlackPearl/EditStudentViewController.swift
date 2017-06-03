//
//  EditStudentViewController.swift
//  BlackPearl
//
//  Created by Jasen Henderson on 6/1/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit

class EditStudentViewController: UIViewController {

    @IBOutlet weak var studentNameTextBox: UITextView!
    @IBOutlet weak var gradeTextBox: UITextView!
    
    var nameLabelText = ""
    var gradeLabelText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentNameTextBox.text = "\(nameLabelText)"
        gradeTextBox.text = "\(gradeLabelText)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentNameTextBox.text = "\(nameLabelText)"
        gradeTextBox.text = "\(gradeLabelText)"
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
