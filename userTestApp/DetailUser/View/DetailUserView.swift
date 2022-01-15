//
//  DetailUserView.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class DetailUserView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()

    lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var eyeColorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    
    let contactsView = ContactsUserView()
    let aboutView = AboutUserView()
    let tagsView = TagsUserView()
    let otherView = OtherUserView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.scrollView.contentSize = CGSize(width: self.bounds.width, height: 900)
        
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.userImageView)
        self.scrollView.addSubview(self.genderLabel)
        self.scrollView.addSubview(self.ageLabel)
        self.scrollView.addSubview(self.eyeColorLabel)
        self.scrollView.addSubview(self.companyLabel)
        self.scrollView.addSubview(self.balanceLabel)
    
        //contacts
        self.scrollView.addSubview(self.contactsView.contactLabel)
        self.scrollView.addSubview(self.contactsView.emailLabel)
        self.scrollView.addSubview(self.contactsView.phoneLabel)
        self.scrollView.addSubview(self.contactsView.adressLabel)
        
        //about
        self.scrollView.addSubview(self.aboutView.aboutLabel)
        self.scrollView.addSubview(self.aboutView.aboutTextView)
        
        //tags
        self.scrollView.addSubview(self.tagsView.tagsLabel)
        self.scrollView.addSubview(self.tagsView.descriptionTagsLabel)
        
        //other
        self.scrollView.addSubview(self.otherView.otherLabel)
        self.scrollView.addSubview(self.otherView.registeredLabel)
        self.scrollView.addSubview(self.otherView.favoriteFruitLabel)
        self.scrollView.addSubview(self.otherView.greetingLabel)
        self.scrollView.addSubview(self.otherView.friendsButton)
        self.scrollView.addSubview(self.otherView.locationButton)
        
        //scrollView
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        //detailPerson
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
            self.userImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 20),
            self.userImageView.heightAnchor.constraint(equalToConstant: 100),
            self.userImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            self.genderLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
            self.genderLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
            self.genderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.genderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.ageLabel.topAnchor.constraint(equalTo: self.genderLabel.bottomAnchor),
            self.ageLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
            self.ageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.ageLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.eyeColorLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor),
            self.eyeColorLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
            self.eyeColorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.eyeColorLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.companyLabel.topAnchor.constraint(equalTo: self.eyeColorLabel.bottomAnchor),
            self.companyLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
            self.companyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.companyLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.balanceLabel.topAnchor.constraint(equalTo: self.companyLabel.bottomAnchor),
            self.balanceLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
            self.balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.balanceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //contacts
        NSLayoutConstraint.activate([
            self.contactsView.contactLabel.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: 20),
            self.contactsView.contactLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Metrics.leading),
            self.contactsView.contactLabel.heightAnchor.constraint(equalToConstant: 40),
            self.contactsView.contactLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.emailLabel.topAnchor.constraint(equalTo: self.contactsView.contactLabel.bottomAnchor),
            self.contactsView.emailLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Metrics.leading),
            self.contactsView.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.emailLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.phoneLabel.topAnchor.constraint(equalTo: self.contactsView.emailLabel.bottomAnchor, constant: 5),
            self.contactsView.phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.contactsView.phoneLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.phoneLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.adressLabel.topAnchor.constraint(equalTo: self.contactsView.phoneLabel.bottomAnchor, constant: 5),
            self.contactsView.adressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.contactsView.adressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.adressLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        //about
        NSLayoutConstraint.activate([
            self.aboutView.aboutLabel.topAnchor.constraint(equalTo: self.contactsView.adressLabel.bottomAnchor, constant: 20),
            self.aboutView.aboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.aboutView.aboutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.aboutView.aboutLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            self.aboutView.aboutTextView.topAnchor.constraint(equalTo: self.aboutView.aboutLabel.bottomAnchor),
            self.aboutView.aboutTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.aboutView.aboutTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.aboutView.aboutTextView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        //tags
        NSLayoutConstraint.activate([
            self.tagsView.tagsLabel.topAnchor.constraint(equalTo: self.aboutView.aboutTextView.bottomAnchor, constant: 20),
            self.tagsView.tagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.tagsView.tagsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.tagsView.tagsLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            self.tagsView.descriptionTagsLabel.topAnchor.constraint(equalTo: self.tagsView.tagsLabel.bottomAnchor),
            self.tagsView.descriptionTagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.tagsView.descriptionTagsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.tagsView.descriptionTagsLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //other
        NSLayoutConstraint.activate([
            self.otherView.otherLabel.topAnchor.constraint(equalTo: self.tagsView.descriptionTagsLabel.bottomAnchor, constant: 20),
            self.otherView.otherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.otherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.otherLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.favoriteFruitLabel.topAnchor.constraint(equalTo: self.otherView.otherLabel.bottomAnchor),
            self.otherView.favoriteFruitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.favoriteFruitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.favoriteFruitLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.greetingLabel.topAnchor.constraint(equalTo: self.otherView.favoriteFruitLabel.bottomAnchor),
            self.otherView.greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.greetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.greetingLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.registeredLabel.topAnchor.constraint(equalTo: self.otherView.greetingLabel.bottomAnchor),
            self.otherView.registeredLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.registeredLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.registeredLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.friendsButton.topAnchor.constraint(equalTo: self.otherView.registeredLabel.bottomAnchor, constant: 30),
            self.otherView.friendsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.otherView.friendsButton.widthAnchor.constraint(equalToConstant: 200),
            self.otherView.friendsButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.locationButton.topAnchor.constraint(equalTo: self.otherView.friendsButton.bottomAnchor, constant: 20),
            self.otherView.locationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.otherView.locationButton.widthAnchor.constraint(equalToConstant: 200),
            self.otherView.locationButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

