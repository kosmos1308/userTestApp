//
//  ContactsUserView.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class ContactsUserView: UIView {

    lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.backgroundColor = .systemGray
        return label
    }()
   
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray5
        return label
    }()
    
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray
        return label
    }()
    
    lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray5
        label.numberOfLines = 2
        return label
    }()
    
}
