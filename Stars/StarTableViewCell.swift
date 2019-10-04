//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Craig Swanson on 10/3/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let star = star else { return }
        
        nameLabel.text = star.name
        distanceLabel.text = star.distanceDescription
    }
}
