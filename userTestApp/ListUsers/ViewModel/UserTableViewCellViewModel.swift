//
//  UserTableViewCellViewModel.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import Foundation

protocol UserTableViewCellViewModelProtocol {
    var userName: String { get }
    var userAge: String { get }
    var userGender: String { get }
    init(user: User)
}

final class UserTableViewCellViewModel: UserTableViewCellViewModelProtocol {
    private let user: User
    
    required init(user: User) {
        self.user = user
    }
    
    var userName: String {
        self.user.name
    }
    
    var userAge: String {
        "\(self.user.age)"
    }
    
    var userGender: String {
        self.user.gender
    }
}
