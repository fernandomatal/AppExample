//
//  ExperienceManager.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/18/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation

class ExperienceManager {
    static let shared = ExperienceManager()
    
    let experiences: [Experience]
    init() {
        if let jstonPath = Bundle.main.path(forResource: "Experience", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: jstonPath), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let experienceDict = jsonResult as? Dictionary<String, AnyObject>, let experience = experienceDict["experience"] as? [[String : Any]] {
                    experiences = experience.map({ try? Experience(object: $0) }).compactMap({ $0 })
                    return
                } else {
                    experiences = []
                }
            } catch {
                print("ERROR: ", error)
                experiences = []
            }
        } else {
            experiences = []
        }
    }
}
