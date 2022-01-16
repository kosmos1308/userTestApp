//
//  FriendsUserViewController.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit

final class FriendsUserViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.tintColor = .systemRed
        button.layer.cornerRadius = Metrics.cornerRadiusCloseButton
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.layer.borderWidth = 1.5
        return button
    }()
    
    private lazy var firstFriendsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var secondFriendsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private lazy var thirdFriendsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    var viewModel: FriendsUserViewModelProtocol? {
        didSet {
            self.firstFriendsLabel.text = self.viewModel?.firstUserFriend
            self.secondFriendsLabel.text = self.viewModel?.secondUserFriend
            self.thirdFriendsLabel.text = self.viewModel?.thirdUserFriend
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        self.setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.firstFriendsLabel)
        self.view.addSubview(self.secondFriendsLabel)
        self.view.addSubview(self.thirdFriendsLabel)
        
        NSLayoutConstraint.activate([
            self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Metrics.top*2),
            self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingTextView),
            self.closeButton.heightAnchor.constraint(equalToConstant: Metrics.widthCloseButton),
            self.closeButton.widthAnchor.constraint(equalToConstant: Metrics.widthCloseButton)
        ])
        
        NSLayoutConstraint.activate([
            self.firstFriendsLabel.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: Metrics.top*2),
            self.firstFriendsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.leadingLabel),
            self.firstFriendsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingLabel),
            self.firstFriendsLabel.heightAnchor.constraint(equalToConstant: Metrics.heightFriendLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.secondFriendsLabel.topAnchor.constraint(equalTo: self.firstFriendsLabel.bottomAnchor),
            self.secondFriendsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.leadingLabel),
            self.secondFriendsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingLabel),
            self.secondFriendsLabel.heightAnchor.constraint(equalToConstant: Metrics.heightFriendLabel)
        ])
        
        NSLayoutConstraint.activate([
            self.thirdFriendsLabel.topAnchor.constraint(equalTo: self.secondFriendsLabel.bottomAnchor),
            self.thirdFriendsLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.leadingLabel),
            self.thirdFriendsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingLabel),
            self.thirdFriendsLabel.heightAnchor.constraint(equalToConstant: Metrics.heightFriendLabel)
        ])
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
