//
//  TagsUserView.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit

final class TagsUserView: UIView {
    lazy var tagsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.backgroundColor = .systemGray
        return label
    }()
    
    lazy var descriptionTagsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.backgroundColor = .systemGray5
        label.numberOfLines = 0
        return label
    }()
}
