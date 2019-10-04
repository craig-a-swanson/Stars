//
//  Star.swift
//  Stars
//
//  Created by Craig Swanson on 10/3/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import Foundation

struct Star: Codable {
    var name: String
    var distanceInLightYears: Double
    
    var distanceDescription: String {
        return "\(distanceInLightYears) light years away"
    }
}
