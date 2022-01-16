//
//  AboutUserView.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit

final class AboutUserView: UIView {

    lazy var aboutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var showMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("show more", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
}
