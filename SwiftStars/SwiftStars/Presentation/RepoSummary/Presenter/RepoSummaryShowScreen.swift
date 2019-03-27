//
//  RepoSummaryUpdateScreen.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol RepoSummaryShowScreen: AnyObject {
    func displayRepositories(_ listRepo: ListRepo)
    
    func showErrorObtainingRepositories()
}
