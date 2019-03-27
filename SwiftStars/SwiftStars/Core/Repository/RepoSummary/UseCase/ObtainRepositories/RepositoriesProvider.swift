//
//  RepositoriesProvider.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol RepositoriesProvider: AnyObject {
    func repositories(page: Int) throws -> ListRepo?
}
