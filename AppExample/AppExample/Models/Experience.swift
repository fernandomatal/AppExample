//
//  Experience.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 2/18/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation
import Marshal

class Experience: Unmarshaling {
    var name: String
    var logo: String
    var role: String
    var joinedAt: Date
    var leftAt: Date?
    var current: Bool
    var location: String
    var mainSkills: [String]
    var description: String
    
    required init(object: MarshaledObject) throws {
        name = try object.value(for: Keys.name.rawValue)
        logo = try object.value(for: Keys.logo.rawValue)
        role = try object.value(for: Keys.role.rawValue)
        joinedAt = try object.value(for: Keys.joinedAt.rawValue)
        leftAt = try object.value(for: Keys.leftAt.rawValue)
        current = try object.value(for: Keys.current.rawValue)
        location = try object.value(for: Keys.location.rawValue)
        mainSkills = try object.value(for: Keys.mainSkills.rawValue)
        description = try object.value(for: Keys.description.rawValue)
    }
    
    enum Keys: String {
        case name = "name"
        case logo = "logo"
        case role = "role"
        case joinedAt = "joinedAt"
        case leftAt = "leftAt"
        case current = "current"
        case location = "location"
        case mainSkills = "mainSkills"
        case description = "description"
    }
}
