//
//  ListUsersViewModel.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import Foundation

protocol ListUsersViewModelProtocol: AnyObject {
    var users: [User] { get }
    func fetchUsers(completion: @escaping() -> Void)
    func countUsers() -> Int
    func tableCellViewModel(at indexPath: IndexPath) -> UserTableViewCellViewModelProtocol
    func collectionViewCellViewModel(at indexPath: IndexPath) -> UserCollectionViewCellViewModelProtocol
    func selectedCell(at indexPath: IndexPath) -> DetailUserViewModelProtocol
}

final class ListUsersViewModel: ListUsersViewModelProtocol {
    var users: [User] = []
    
    func fetchUsers(completion: @escaping () -> Void) {
        NetworkingManager.shared.fetchData { users in
            self.users = users
            completion()
        }
    }
    
    func countUsers() -> Int {
        return self.users.count
    }
    
    func collectionViewCellViewModel(at indexPath: IndexPath) -> UserCollectionViewCellViewModelProtocol {
        let user = self.users[indexPath.item]
        return UserCollectionViewCellViewModel(user: user)
    }
    
    func tableCellViewModel(at indexPath: IndexPath) -> UserTableViewCellViewModelProtocol {
        let user = self.users[indexPath.row]
        return UserTableViewCellViewModel(user: user)
    }
    
    func selectedCell(at indexPath: IndexPath) -> DetailUserViewModelProtocol {
        let user = self.users[indexPath.row]
        return DetailUserViewModel(user: user)
    }
}

