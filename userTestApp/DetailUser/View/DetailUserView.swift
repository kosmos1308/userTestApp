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
        imageView.image = UIImage(systemName: "figure.wave.circle.fill")
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Metrics.cornerRadius
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
        
        self.scrollView.contentSize = CGSize(width: self.bounds.width, height: Metrics.scrollDirection)
        
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
        self.scrollView.addSubview(self.aboutView.descriptionLabel)
        self.scrollView.addSubview(self.aboutView.showMoreButton)
        
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
            self.userImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Metrics.top),
            self.userImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Metrics.leading),
            self.userImageView.heightAnchor.constraint(equalToConstant: Metrics.height*2),
            self.userImageView.widthAnchor.constraint(equalToConstant: Metrics.width/2)
        ])
        
        NSLayoutConstraint.activate([
            self.genderLabel.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: Metrics.top),
            self.genderLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: Metrics.leading),
            self.genderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.genderLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.ageLabel.topAnchor.constraint(equalTo: self.genderLabel.bottomAnchor),
            self.ageLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: Metrics.leading),
            self.ageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.ageLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.eyeColorLabel.topAnchor.constraint(equalTo: self.ageLabel.bottomAnchor),
            self.eyeColorLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: Metrics.leading),
            self.eyeColorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.eyeColorLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.companyLabel.topAnchor.constraint(equalTo: self.eyeColorLabel.bottomAnchor),
            self.companyLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: Metrics.leading),
            self.companyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.companyLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.balanceLabel.topAnchor.constraint(equalTo: self.companyLabel.bottomAnchor),
            self.balanceLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: Metrics.leading),
            self.balanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.balanceLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        //contacts
        NSLayoutConstraint.activate([
            self.contactsView.contactLabel.topAnchor.constraint(equalTo: self.userImageView.bottomAnchor, constant: Metrics.betweenViews),
            self.contactsView.contactLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Metrics.leading),
            self.contactsView.contactLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel),
            self.contactsView.contactLabel.widthAnchor.constraint(equalToConstant: Metrics.width)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.emailLabel.topAnchor.constraint(equalTo: self.contactsView.contactLabel.bottomAnchor),
            self.contactsView.emailLabel.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: Metrics.leading),
            self.contactsView.emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.emailLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.phoneLabel.topAnchor.constraint(equalTo: self.contactsView.emailLabel.bottomAnchor, constant: Metrics.betweenLabels),
            self.contactsView.phoneLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.contactsView.phoneLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.phoneLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.contactsView.adressLabel.topAnchor.constraint(equalTo: self.contactsView.phoneLabel.bottomAnchor, constant: Metrics.betweenLabels),
            self.contactsView.adressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.contactsView.adressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.contactsView.adressLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        //about
        NSLayoutConstraint.activate([
            self.aboutView.aboutLabel.topAnchor.constraint(equalTo: self.contactsView.adressLabel.bottomAnchor, constant: Metrics.betweenViews),
            self.aboutView.aboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.aboutView.aboutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.aboutView.aboutLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.aboutView.descriptionLabel.topAnchor.constraint(equalTo: self.aboutView.aboutLabel.bottomAnchor),
            self.aboutView.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.aboutView.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.aboutView.descriptionLabel.heightAnchor.constraint(equalToConstant: Metrics.height*1.3)
        ])
        
        NSLayoutConstraint.activate([
            self.aboutView.showMoreButton.topAnchor.constraint(equalTo: self.aboutView.descriptionLabel.bottomAnchor),
            self.aboutView.showMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.aboutView.showMoreButton.widthAnchor.constraint(equalToConstant: Metrics.width/2),
            self.aboutView.showMoreButton.heightAnchor.constraint(equalToConstant: Metrics.heightButton/2)
        ])
        
        //tags
        NSLayoutConstraint.activate([
            self.tagsView.tagsLabel.topAnchor.constraint(equalTo: self.aboutView.descriptionLabel.bottomAnchor, constant: Metrics.betweenViews),
            self.tagsView.tagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.tagsView.tagsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.tagsView.tagsLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.tagsView.descriptionTagsLabel.topAnchor.constraint(equalTo: self.tagsView.tagsLabel.bottomAnchor),
            self.tagsView.descriptionTagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.tagsView.descriptionTagsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.tagsView.descriptionTagsLabel.heightAnchor.constraint(equalToConstant: Metrics.height)
        ])
        
        //other
        NSLayoutConstraint.activate([
            self.otherView.otherLabel.topAnchor.constraint(equalTo: self.tagsView.descriptionTagsLabel.bottomAnchor, constant: Metrics.betweenViews),
            self.otherView.otherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.otherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.otherLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.favoriteFruitLabel.topAnchor.constraint(equalTo: self.otherView.otherLabel.bottomAnchor),
            self.otherView.favoriteFruitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.favoriteFruitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.favoriteFruitLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.greetingLabel.topAnchor.constraint(equalTo: self.otherView.favoriteFruitLabel.bottomAnchor),
            self.otherView.greetingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.greetingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.greetingLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel*2)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.registeredLabel.topAnchor.constraint(equalTo: self.otherView.greetingLabel.bottomAnchor),
            self.otherView.registeredLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.leading),
            self.otherView.registeredLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Metrics.trailing),
            self.otherView.registeredLabel.heightAnchor.constraint(equalToConstant: Metrics.heightLabel/2)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.friendsButton.topAnchor.constraint(equalTo: self.otherView.registeredLabel.bottomAnchor, constant: Metrics.bottomButton),
            self.otherView.friendsButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.otherView.friendsButton.widthAnchor.constraint(equalToConstant: Metrics.widthButton),
            self.otherView.friendsButton.heightAnchor.constraint(equalToConstant: Metrics.heightButton)
        ])
        
        NSLayoutConstraint.activate([
            self.otherView.locationButton.topAnchor.constraint(equalTo: self.otherView.friendsButton.bottomAnchor, constant: Metrics.bottomButton),
            self.otherView.locationButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.otherView.locationButton.widthAnchor.constraint(equalToConstant: Metrics.widthButton),
            self.otherView.locationButton.heightAnchor.constraint(equalToConstant: Metrics.heightButton)
        ])
    }
}

