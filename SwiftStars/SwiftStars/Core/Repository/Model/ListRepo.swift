//
//  ListRepo.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct ListRepo: Codable {
    var totalCount: Int64
    var isIncomplete: Bool
    var items: [Repo]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case isIncomplete = "incomplete_results"
        case items
    }
}
