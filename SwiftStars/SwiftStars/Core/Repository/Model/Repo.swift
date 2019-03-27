//
//  Repo.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Repo: Codable {
    var id: Int64
    var name: String
    var stargazersCount: Int64
    var owner: Owner
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case stargazersCount = "stargazers_count"
        case owner
    }
}
