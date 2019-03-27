//
//  ObtainRepositoriesExecutor.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainRepositoriesExecutor: AnyObject {
    func obtainDisplayableRepositories(page: Int) throws -> ListRepo
}
