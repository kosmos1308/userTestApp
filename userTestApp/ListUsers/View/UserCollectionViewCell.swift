//
//  UserCollectionViewCell.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class UserCollectionViewCell: UICollectionViewCell {
    
    static let id = "UserCollectionViewCell"
    
    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        imageView.layer.borderWidth = Metrics.borderWidth
        imageView.layer.cornerRadius = Metrics.cornerRadius
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var genderAndAgeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    var viewModel: UserCollectionViewCellViewModelProtocol? {
        didSet {
            guard let gender = self.viewModel?.userGender.first else { return }
            guard let age = self.viewModel?.userAge else { return }
            self.genderAndAgeLabel.text = gender.uppercased() + ", " + age
            self.userNameLabel.text = self.viewModel?.userName
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.userImageView)
        self.addSubview(self.userNameLabel)
        self.addSubview(self.genderAndAgeLabel)
        
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.userImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.userNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.userNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.userNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Metrics.bottom),
            self.userNameLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.genderAndAgeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.top),
            self.genderAndAgeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.genderAndAgeLabel.widthAnchor.constraint(equalToConstant: Metrics.widthLabel),
            self.genderAndAgeLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
    }
}

