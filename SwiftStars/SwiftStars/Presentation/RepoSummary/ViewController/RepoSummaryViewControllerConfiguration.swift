//
//  RepoSummaryViewControllerConfiguration.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension RepoSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    internal func createCustomTableView() {
        let frame = self.view.frame
        let customView = CustomView(frame: frame)
        view = customView
    }
    
    internal func initialize() {
        self.startApplication()
        self.configureCustomTableView()
        self.configurateTitle()
        self.configureRefreshControl()
    }
    
    private func startApplication() {
        self.customView.startActivityIndicator()
    }

    private func configureCustomTableView() {
        self.customView.configureDelegate(self)
        self.customView.configureDataSource(self)
        self.customView.register(RepoSummaryTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func configurateTitle() {
        self.title = "Repositories"
    }
    
    private func configureRefreshControl() {
        if #available(iOS 10.0, *) {
            self.customView.refreshControl = self.refreshControl
        } else {
            self.customView.addSubview(self.refreshControl)
        }
        
        self.refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
    }
    
    @objc private func refreshTableView() {
        self.loadRepoInitalPage()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = self.listRepo?.items else {
            return 0
        }
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RepoSummaryTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        let item = self.listRepo?.items[row]
        cell.set(item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.customView.deselectRow(at: indexPath, animated: true)
    }
}
