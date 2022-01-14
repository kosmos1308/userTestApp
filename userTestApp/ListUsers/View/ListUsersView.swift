//
//  ListUsersView.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class ListUsersView: UIView {

    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var usersCollectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UserCollectionViewCell.self,
                    forCellWithReuseIdentifier: UserCollectionViewCell.id)
        return cv
    }()
    
    lazy var usersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UserTableViewCell.self,
                           forCellReuseIdentifier: UserTableViewCell.id)
        return tableView
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.usersCollectionView)
        self.addSubview(self.usersTableView)
        
        NSLayoutConstraint.activate([
            self.usersCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.usersCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.usersCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.usersCollectionView.heightAnchor.constraint(equalToConstant: Metrics.heightCollectionView)
        ])
        
        NSLayoutConstraint.activate([
            self.usersTableView.topAnchor.constraint(equalTo: self.usersCollectionView.bottomAnchor),
            self.usersTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.usersTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.usersTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
