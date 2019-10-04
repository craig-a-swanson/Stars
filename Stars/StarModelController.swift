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
    
    //when a star model is created (above line), it loads the data
    
    init() {
        loadFromPersistentStore()
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else { return nil }
        return documents.appendingPathComponent("stars.plist")
    }
    
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distanceInLightYears: distance)
        
        stars.append(star)
        saveToPersistentStore()
        
        return star
    }
    
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription).\n"
        }
        return output
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(stars)
        } catch {
         print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
