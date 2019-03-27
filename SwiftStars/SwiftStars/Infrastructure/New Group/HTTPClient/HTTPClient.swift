//
//  HTTPClient.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol HTTPClient {
    func get<T>(_ remote: RemoteAddress, with queryParamenters:[String: String]) throws -> T? where T: Decodable
}
