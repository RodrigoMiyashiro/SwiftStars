//
//  RepoSummaryTableViewCell.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 26/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class RepoSummaryTableViewCell: UITableViewCell {
    private lazy var repoName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var numberOfStars: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var photoOwner: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "img_placeholder")
        return imageView
    }()

    private lazy var repoOwner: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configureViewComponents()
        self.configureConstraints()
        self.configureImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViewComponents() {
        self.addSubview(self.repoName)
        self.addSubview(self.numberOfStars)
        self.addSubview(self.photoOwner)
        self.addSubview(self.repoOwner)
    }
    
    private func configureConstraints() {
        self.constraintsRepoName()
        self.constraintsNumberOfStars()
        self.constraintsPhotoOwner()
        self.constraintsRepoOwner()
    }
    
    private func configureImageView() {
        self.layoutIfNeeded()
        self.photoOwner.layer.cornerRadius = self.photoOwner.frame.width/2.0
    }
    
    private func constraintsRepoName() {
        self.repoName.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0).isActive = true
        self.repoName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        self.repoName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
    }
    
    private func constraintsNumberOfStars() {
        self.numberOfStars.leadingAnchor.constraint(equalTo: self.repoName.leadingAnchor, constant: 0.0).isActive = true
        self.numberOfStars.trailingAnchor.constraint(equalTo: self.repoName.trailingAnchor, constant: 0.0).isActive = true
        self.numberOfStars.topAnchor.constraint(equalTo: self.repoName.bottomAnchor, constant: 0.0).isActive = true
    }
    
    private func constraintsPhotoOwner() {
        self.photoOwner.topAnchor.constraint(greaterThanOrEqualTo: self.numberOfStars.bottomAnchor, constant: -8.0).isActive = true
        self.photoOwner.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.photoOwner.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.photoOwner.trailingAnchor.constraint(equalTo: self.repoName.trailingAnchor, constant: 0.0).isActive = true
        self.photoOwner.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0).isActive = true
    }
    
    private func constraintsRepoOwner() {
        self.repoOwner.trailingAnchor.constraint(equalTo: self.photoOwner.leadingAnchor, constant: -4.0).isActive = true
        self.repoOwner.centerYAnchor.constraint(equalTo: self.photoOwner.centerYAnchor, constant: 0.0).isActive = true
        self.repoOwner.leadingAnchor.constraint(equalTo: self.repoName.leadingAnchor, constant: 0.0).isActive = true
        self.repoOwner.topAnchor.constraint(equalTo: self.photoOwner.topAnchor, constant: 0.0).isActive = true
        self.repoOwner.bottomAnchor.constraint(equalTo: self.photoOwner.bottomAnchor, constant: 0.0).isActive = true
    }
    
    func set(_ repo: Repo?) {
        let owner = repo?.owner
        
        self.repoName.text = repo?.name
        self.numberOfStars.text = "Stars: \(repo?.stargazersCount ?? 0)"
        self.repoOwner.text = owner?.name
        
        self.loadImage(withURL: owner?.avatarURL ?? "")
    }
    
    private func loadImage(withURL url: String) {
        let url = URL(string: url)
        self.photoOwner.load(url: url)
    }
}
