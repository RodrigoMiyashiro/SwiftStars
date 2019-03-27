//
//  RepoSummaryViewController.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let initialPosition: Int = 0

class RepoSummaryViewController: UIViewController, HasCustomView, RepoSummaryShowScreen {
    internal var presenter: RepoSummaryPresenter?
    internal var listRepo: ListRepo?
    internal var page: Int = initialPosition
    
    typealias CustomView = RepoSummaryTableView
    internal let refreshControl = UIRefreshControl()
    
    override func loadView() {
        super.loadView()
        self.createCustomTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
        self.loadRepoInitalPage()
    }
    
    internal func loadRepoInitalPage() {
        self.page = initialPosition
        self.loadRepos()
    }
    
    internal func loadRepos() {
        let executor = DefaultObtainRepositoriesExecutor()
        self.presenter = RepoSummaryPresenter(screen: self, executor: executor)
        
        self.customView.startActivityIndicator()
        
        self.presenter?.retrieveRepositories(page: self.page)
    }
    
    func displayRepositories(_ listRepo: ListRepo) {
        self.listRepo = self.mountListRepo(listRepo)
        
        self.customView.reloadData()
        self.refreshControl.endRefreshing()
        self.customView.stopActivityIndicator()
    }
    
    private func mountListRepo(_ list: ListRepo) -> ListRepo? {
        if self.page > initialPosition {
            var copyCurrentList = self.listRepo
            copyCurrentList?.items += list.items
            copyCurrentList?.isIncomplete = list.isIncomplete
            copyCurrentList?.totalCount = list.totalCount
            
            return copyCurrentList
        }
        
        return list
    }
    
    func showErrorObtainingRepositories() {
        print("🕵️‍♂️ Error...")
        self.refreshControl.endRefreshing()
        self.customView.stopActivityIndicator()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            self.page += 1
            self.loadRepos()
        }
    }
}
