//
//  FriendsUserViewModel.swift
//  userTestApp
//
//  Created by pavel on 16.01.22.
//

import Foundation

protocol FriendsUserViewModelProtocol {
    var friends: [Friend] { get set }
    var firstUserFriend: String { get }
    var secondUserFriend: String { get }
    var thirdUserFriend: String { get }
    init(friends: [Friend])
}

final class FriendsUserViewModel: FriendsUserViewModelProtocol {

    var friends: [Friend]
    
    var firstUserFriend: String {
        return "1. \(self.friends[0].name)"
    }
    
    var secondUserFriend: String {
        return "2. \(self.friends[1].name)"
    }
    
    var thirdUserFriend: String {
        return "3. \(self.friends[2].name)"
    }
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
