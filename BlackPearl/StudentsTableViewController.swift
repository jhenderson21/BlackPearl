//
//  StudentsTableViewController.swift
//  BlackPearl
//
//  Created by Jasen on 5/31/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit
import CoreData

var students : [NSManagedObject] = []


class StudentsTableViewController: UITableViewController {
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }

    
    @IBAction func unwindToCreateStudent(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsTableViewCell

        let student = students[indexPath.row]
        
        cell.nameLabel.text = student.value(forKey: "name") as? String
        cell.gradeLabel.text = student.value(forKey: "grade") as? String
        cell.periodLabel.text = student.value(forKey: "period") as? String
        
        
        
        
        
        //cell.nameLabel.text = student.value(forKeyPath: "name") as? String
        //cell.gradeLabel.text = student.value(forKey: "grade") as? String
        //cell.nameLabel.text = student.value(forKey: "period") as? String
        
        
        // Configure the cell...

        return cell
    }
    
    
    var selectedStudent : String = ""
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            if let indexPath = self.tableView?.indexPathForSelectedRow {
                let student = students[indexPath.row]
                let controller = segue.destination as! StudentDetailViewController
                
                controller.selectedName =  student.value(forKey: "name") as! String
                controller.selectedGrade = student.value(forKey: "grade") as! String
                controller.selectedPeriod = student.value(forKey: "period") as! String
                
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentsTableViewCell
        performSegue(withIdentifier: "toDetailView", sender: self)
        
}

        


    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  
}
