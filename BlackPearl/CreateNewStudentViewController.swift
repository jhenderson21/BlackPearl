//
//  CreateNewStudentViewController.swift
//  BlackPearl
//
//  Created by Jasen on 5/31/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit
import CoreData

var isTarget: Bool? = nil


class CreateNewStudentViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate   {
    
    @IBAction func unwindToCreate(segue: UIStoryboardSegue) {
        print("Unwind to Root View Controller")
    }
    
    var newTargetBehavior = ""
    var newReplacementBehavior = ""
    
    
//    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var studentNameTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var periodTextField: UITextField!
    @IBOutlet weak var replacementButton: ReplacementBehaviorButton!
    
    @IBOutlet weak var targetButton: TargetBehaviorButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func newStudentAction(_ sender: Any) {
        
        
        save(name: "\(String(describing: studentNameTextField.text!))", grade: "\(String(describing: gradeTextField.text!))", period: "\(String(describing: periodTextField.text!))")
        
        print(students)
        
    }
    
    
    
    
    
    func save(name: String, grade: String, period: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Student",
                                       in: managedContext)!
        
        let student = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        
        // 3
        student.setValue(name, forKeyPath: "name")
        student.setValue(grade, forKey: "grade")
        student.setValue(period, forKey: "period")
        
        
        
        // 4
        do {
            try managedContext.save()
            students.append(student)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        
        
        
    }
    
    
    @IBAction func replacementBehaviorButton(_ sender: Any) {
        isTarget = false
        
        performSegue(withIdentifier: "toBehaviors", sender: self)
    }
    
    
    @IBAction func targetBehaviorButton(_ sender: Any) {
        isTarget = true
        
        performSegue(withIdentifier: "toBehaviors", sender: self)
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Actions

//    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
//        
//        // Hide the keyboard.
//        studentNameTextField.resignFirstResponder()
//        
//        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
//        let imagePickerController = UIImagePickerController()
//        
//        // Only allow photos to be picked, not taken.
//        imagePickerController.sourceType = .photoLibrary
//        
//        // Make sure ViewController is notified when the user picks an image.
//        imagePickerController.delegate = self
//        present(imagePickerController, animated: true, completion: nil)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        
//        // The info dictionary may contain multiple representations of the image. You want to use the original.
//        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
//            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
//        }
//        
//        // Set photoImageView to display the selected image.
//        photoImageView.image = selectedImage
//        
//        // Dismiss the picker.
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        // Dismiss the picker if the user canceled.
//        dismiss(animated: true, completion: nil)
//    }
//    
//    //MARK: UIImagePickerControllerDelegate
//   
//   
   
    

}
