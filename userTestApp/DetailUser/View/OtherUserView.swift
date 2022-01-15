//
//  OtherUserView.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit

final class OtherUserView: UIView {

    lazy var otherLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.backgroundColor = .systemGray
        return label
    }()

    lazy var registeredLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray5
        return label
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray
        label.numberOfLines = 3
        return label
    }()
    
    lazy var favoriteFruitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray5
        return label
    }()
    
    lazy var friendsButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show friends", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.setTitleColor(UIColor.systemGreen, for: .normal)
        return btn
    }()
    
    lazy var locationButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Show location", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        btn.setTitleColor(UIColor.systemGreen, for: .normal)
        return btn
    }()
}
