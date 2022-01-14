//
//  UserTableViewCell.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    
    static let id = "UserTableViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    var viewModel: UserTableViewCellViewModelProtocol? {
        didSet {
            self.nameLabel.text = self.viewModel?.userName
            self.ageLabel.text = self.viewModel?.userAge
            self.genderLabel.text = self.viewModel?.userGender
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.nameLabel)
        self.addSubview(self.genderLabel)
        self.addSubview(self.ageLabel)
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.nameLabel.heightAnchor.constraint(equalToConstant: Metrics.height),
            self.nameLabel.widthAnchor.constraint(equalToConstant: Metrics.width)
        ])
        
        NSLayoutConstraint.activate([
            self.ageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top),
            self.ageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.ageLabel.heightAnchor.constraint(equalToConstant: Metrics.height/2),
            self.ageLabel.widthAnchor.constraint(equalToConstant: Metrics.widthLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.genderLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            self.genderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.genderLabel.heightAnchor.constraint(equalToConstant: Metrics.height/2),
            self.genderLabel.widthAnchor.constraint(equalToConstant: Metrics.widthLabel)
        ])
    }
}
