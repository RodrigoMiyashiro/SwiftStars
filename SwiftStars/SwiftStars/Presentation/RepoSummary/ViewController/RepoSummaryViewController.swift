//
//  RepoSummaryViewController.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

private let initialPosition: Int = 1

class RepoSummaryViewController: UIViewController, HasCustomView, RepoSummaryShowScreen {
    internal var presenter: RepoSummaryPresenter?
    internal var listRepo: ListRepo?
    private var page: Int = initialPosition
    internal var currentPage: Int = initialPosition
    
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
        self.configureInfiniteScroll()
    }
    
    internal func loadRepoInitalPage() {
        self.currentPage = initialPosition
        self.page = initialPosition
        self.loadRepos()
    }
    
    internal func configureInfiniteScroll() {
        self.customView.addInfiniteScroll { (tableView) in
            if self.currentPage == self.page {
                self.currentPage += 1
                self.loadRepos()
            }
            
            tableView.finishInfiniteScroll()
        }
    }
    
    internal func loadRepos() {
        let executor = DefaultObtainRepositoriesExecutor()
        self.presenter = RepoSummaryPresenter(screen: self, executor: executor)
        
        self.presenter?.retrieveRepositories(page: self.page)
    }
    
    func displayRepositories(_ listRepo: ListRepo) {
        self.listRepo = self.mountListRepo(listRepo)
        
        self.calculateCurrentPage()
        self.customView.reloadData()
        self.refreshControl.endRefreshing()
        self.customView.stopActivityIndicator()
    }
    
    private func calculateCurrentPage() {
        if self.currentPage == self.page {
            self.currentPage += 1
        }
        
        self.page = self.currentPage
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
}
