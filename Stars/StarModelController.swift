//
//  StarModelController.swift
//  Stars
//
//  Created by Craig Swanson on 10/3/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import Foundation

class StarModelController {
    // by marking the setter as private, means that nothing else can enter things into this array
    // Also, when empty parentheses are after a type, it creates a new instance of that type -- eg:   var starA = [Star]() would work just as well
    private(set) var stars: [Star] = []
    
    func createStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distanceInLightYears: distance)
        
        stars.append(star)
    }
}
