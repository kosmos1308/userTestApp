//
//  DetailUserViewController.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class DetailUserViewController: UIViewController {
    
    private var detailUserView = DetailUserView()
    
    var viewModel: DetailUserViewModelProtocol? {
        didSet {
            
            //info
            self.title = self.viewModel?.userName
            self.detailUserView.genderLabel.text = self.viewModel?.userGender
            self.detailUserView.ageLabel.text = self.viewModel?.userAge
            self.detailUserView.eyeColorLabel.text = self.viewModel?.userEyeColor
            self.detailUserView.companyLabel.text = self.viewModel?.userCompany
            self.detailUserView.balanceLabel.text = self.viewModel?.userBalance
            self.detailUserView.userImageView.layer.borderColor = (self.viewModel?.userActive ?? false) ? UIColor.systemGreen.cgColor : UIColor.systemGray5.cgColor

            //contacts
            self.detailUserView.contactsView.contactLabel.text = self.viewModel?.contacts
            self.detailUserView.contactsView.emailLabel.text = self.viewModel?.userEmail
            self.detailUserView.contactsView.phoneLabel.text = self.viewModel?.userPhone
            self.detailUserView.contactsView.adressLabel.text = self.viewModel?.userAdress
            
            //about
            self.detailUserView.aboutView.aboutLabel.text = self.viewModel?.about
            self.detailUserView.aboutView.descriptionLabel.text = self.viewModel?.userAbout
            
            //tags
            self.detailUserView.tagsView.tagsLabel.text = self.viewModel?.tags
            self.detailUserView.tagsView.descriptionTagsLabel.text = self.viewModel?.userTags
            
            //other
            self.detailUserView.otherView.otherLabel.text = self.viewModel?.other
            self.detailUserView.otherView.favoriteFruitLabel.text = self.viewModel?.userFavoriteFruit
            self.detailUserView.otherView.greetingLabel.text = self.viewModel?.userGreeting
            self.detailUserView.otherView.registeredLabel.text = self.viewModel?.userRegistered
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.updateNavBar()
        
        self.detailUserView.frame = self.view.bounds
        self.view.addSubview(self.detailUserView)
        
        self.detailUserView.otherView.friendsButton.addTarget(self,
                                            action: #selector(showFriendsButtonTapped),
                                            for: .touchUpInside)
        
        self.detailUserView.otherView.locationButton.addTarget(self,
                                            action: #selector(showLocationButtonTapped),
                                            for: .touchUpInside)
        
        self.detailUserView.aboutView.showMoreButton.addTarget(self,
                                            action: #selector(showAboutUserTapped),
                                            for: .touchUpInside)
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    @objc private func showAboutUserTapped() {
        let aboutViewModel = self.viewModel?.selectedShowMore(about: self.viewModel?.userAbout ?? "")
        let aboutUserVC = AboutUserViewController()
        aboutUserVC.viewModel = aboutViewModel
        aboutUserVC.modalPresentationStyle = .fullScreen
        present(aboutUserVC, animated: true, completion: nil)
    }
    
    @objc private func showFriendsButtonTapped() {
        let friendsViewModel = self.viewModel?.selectedShowFriends(friends: self.viewModel?.userFriends ?? [])
        let friendsVC = FriendsUserViewController()
        friendsVC.viewModel = friendsViewModel
        friendsVC.modalPresentationStyle = .fullScreen
        present(friendsVC, animated: true, completion: nil)
    }

    
    @objc private func showLocationButtonTapped() {
        let locationViewModel = self.viewModel?.selectedShowLocation(name: self.viewModel?.userName ?? "",
                                                                     latitude: self.viewModel?.userLatitude ?? 0,
                                                                     longitude: self.viewModel?.userLongitude ?? 0)
        let locationVC = LocationUserViewController()
        locationVC.viewModel = locationViewModel
        locationVC.modalPresentationStyle = .fullScreen
        present(locationVC, animated: true, completion: nil)
    }
}
