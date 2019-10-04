//
//  StarsViewController.swift
//  Stars
//
//  Created by Craig Swanson on 10/3/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
    
    let starController = StarModelController()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printStars(_ sender: UIButton) {
        print(starController.listStars())
    }
    
    @IBAction func createStar(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distanceString) else { return }
        
        starController.createStar(named: name, withDistance: distance)
        
        nameTextField.text = ""
        distanceTextField.text = ""
        
        nameTextField.becomeFirstResponder()
        
        tableView.reloadData()
    }
}

extension StarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { fatalError("A star cell was not found.") }
        let star = starController.stars[indexPath.row] // includes sections as well!!
        cell.star = star
        
        return cell
    }
    
    
}
