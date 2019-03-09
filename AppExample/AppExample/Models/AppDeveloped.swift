//
//  AppDeveloped.swift
//  AppExample
//
//  Created by Luis Fernando Mata on 3/9/19.
//  Copyright © 2019 Fernando. All rights reserved.
//

import Foundation
import Marshal

class AppDeveloped: Unmarshaling {
    var name: String
    var description: String
    var platform: String
    var users: String
    var os: String
    var language: String
    var technologies: [String]
    
    required init(object: MarshaledObject) throws {
        name = try object.value(for: Keys.name.rawValue)
        description = try object.value(for: Keys.description.rawValue)
        platform = try object.value(for: Keys.platform.rawValue)
        users = try object.value(for: Keys.users.rawValue)
        os = try object.value(for: Keys.os.rawValue)
        language = try object.value(for: Keys.language.rawValue)
        technologies = try object.value(for: Keys.technologies.rawValue)
    }
    
    enum Keys: String {
        case name = "name"
        case description = "description"
        case platform = "platform"
        case users = "users"
        case os = "os"
        case language = "language"
        case technologies = "technologies"
    }
}
