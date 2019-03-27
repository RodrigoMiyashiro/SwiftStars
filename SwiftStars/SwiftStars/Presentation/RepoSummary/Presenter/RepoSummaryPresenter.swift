//
//  RepoSummaryPresenter.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class RepoSummaryPresenter {
    unowned let screen: RepoSummaryShowScreen
    unowned let executor: ObtainRepositoriesExecutor

    init(screen: RepoSummaryShowScreen, executor: ObtainRepositoriesExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveRepositories(page: Int) {
        do {
            let repos = try self.executor.obtainDisplayableRepositories(page: page)

            self.screen.displayRepositories(repos)
        } catch {
            self.screen.showErrorObtainingRepositories()
        }
    }
}
