//
//  StarsViewController.swift
//  Stars
//
//  Created by Craig Swanson on 10/3/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printStars(_ sender: UIButton) {
        print("Tapped on print stars")
    }
    
    @IBAction func createStar(_ sender: UIButton) {
        print("Tapped on create a star")
    }
}

