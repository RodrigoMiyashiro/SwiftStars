//
//  HTTPError.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

enum HTTPError: Error {
    case requestError(_ message: String)
}
