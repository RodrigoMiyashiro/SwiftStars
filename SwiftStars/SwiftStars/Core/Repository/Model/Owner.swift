//
//  Owner.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Owner: Codable {
    var name: String
    var avatarURL: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
        case avatarURL = "avatar_url"
    }
}
