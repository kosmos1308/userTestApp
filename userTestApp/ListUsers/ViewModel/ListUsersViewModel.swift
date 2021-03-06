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
    var sortAgeUsers: (([User]) -> Void)? { get set }
    func sortAgeUpUsersPressed()
    func sortAgeDownUsersPressed()
    var filterGender: (([User]) -> Void)? { get set }
    func malePressed()
    func femalePressed()
    var updateUsers: (([User]) -> Void)? { get set }
    func updatePressed()
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
    
    var sortAgeUsers: (([User]) -> Void)?
    
    func sortAgeUpUsersPressed() {
        self.sortAgeUsers?(self.users.sorted { $0.age < $1.age })
    }
    
    func sortAgeDownUsersPressed() {
        self.sortAgeUsers?(self.users.sorted { $0.age > $1.age })
    }
    
    var filterGender: (([User]) -> Void)?
    
    func malePressed() {
        self.filterGender?(self.users.filter({$0.gender == "male"}))
    }
    
    func femalePressed() {
        self.filterGender?(self.users.filter({$0.gender == "female"}))
    }
    
    var updateUsers: (([User]) -> Void)?
    
    func updatePressed() {
        self.updateUsers?(self.users)
    }
}
