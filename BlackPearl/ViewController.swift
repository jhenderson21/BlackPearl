//
//  ViewController.swift
//  BlackPearl
//
//  Created by Jasen on 5/31/17.
//  Copyright © 2017 otter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "toTableView", sender: self)
    }

}

