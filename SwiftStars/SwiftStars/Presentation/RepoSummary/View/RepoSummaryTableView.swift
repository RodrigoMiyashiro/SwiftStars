//
//  RepoSummaryTableView.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class RepoSummaryTableView: UITableView, CodeView {
    var activityIndicator: ActivityIndicator?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        self.backgroundColor = UIColor.white
        self.configureTB()
    }
    
    func setupConstraints() {
    }
    
    func setupExtraConfigurations() {
        self.activityIndicator = ActivityIndicator(frame: self.frame)
    }

    func startActivityIndicator() {
        guard let activityIndicator = self.activityIndicator else {
            return
        }
        
        self.addSubview(activityIndicator)
    }

    func stopActivityIndicator() {
        self.activityIndicator?.removeFromSuperview()
    }
    
    func setNumberOfRows(inSection rows: Int) {
        self.numberOfRows(inSection: rows)
    }
    
    func configureDelegate(_ delegate: UITableViewDelegate) {
        self.delegate = delegate
    }
    
    func configureDataSource(_ dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
    
    private func configureTB() {
        self.tableFooterView = UIView()
    }
}
