//
//  RepoSummaryPresenter.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//
import UIKit

class RepoSummaryPresenter {
    unowned let screen: RepoSummaryShowScreen
    unowned let executor: ObtainRepositoriesExecutor

    init(screen: RepoSummaryShowScreen, executor: ObtainRepositoriesExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveRepositories(page: Int) {
        self.executor.obtainDisplayableRepositories(page: page) { (repos, error) in
            if error != nil {
                self.screen.showErrorObtainingRepositories()
                return
            }
            
            self.screen.displayRepositories(repos!)
        }
    }
}
