//
//  DetailUserViewModel.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import Foundation

protocol DetailUserViewModelProtocol: AnyObject {
    //personal
    var userName: String { get }
    var userGender: String { get }
    var userAge: String { get }
    var userEyeColor: String { get }
    var userCompany: String { get }
    var userBalance: String { get }
    var userActive: Bool { get }
    
    //contacts
    var contacts: String { get }
    var userEmail: String { get }
    var userPhone: String { get }
    var userAdress: String { get }
    var userLatitude: Double { get }
    var userLongitude: Double { get }
    
    //about
    var about: String { get }
    var userAbout: String { get }
    func selectedShowMore(about: String) -> AboutUserViewModelProtocol
    
    //tags
    var tags: String { get }
    var userTags: String { get }
    
    //other
    var other: String { get }
    var userFavoriteFruit: String { get }
    var userGreeting: String { get }
    var userRegistered: String { get }
    var userFriends: [Friend] { get }
    
    //buttons
    func selectedShowFriends(friends: [Friend]) -> FriendsUserViewModelProtocol
    func selectedShowLocation(name: String, latitude: Double, longitude: Double) -> LocationUserViewModelProtocol

    init(user: User)
}

final class DetailUserViewModel: DetailUserViewModelProtocol {
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var userName: String {
        self.user.name
    }
    
    var userGender: String {
        "Gender: " + self.user.gender
    }
    
    var userAge: String {
        "Age: \(self.user.age)"
    }
    
    var userEyeColor: String {
        "Color eyes: " + self.user.eyeColor
    }
    
    var userCompany: String {
        "Company: " + self.user.company.localizedCapitalized
    }
    
    var userBalance: String {
        "Balance: " + self.user.balance
    }
    
    var userActive: Bool {
        self.user.isActive
    }
    
    var contacts: String {
        "Contacts"
    }
    
    var userEmail: String {
        "✉️ " + self.user.email
    }
    
    var userPhone: String {
        "📞 " + self.user.phone
    }
    
    var userAdress: String {
        "📍 " + self.user.address
    }
    
    var userLatitude: Double {
        self.user.latitude
    }
    
    var userLongitude: Double {
        self.user.longitude
    }
    
    var about: String {
        "About"
    }
    
    var userAbout: String {
        self.user.about
    }
    
    var tags: String {
        "Tags"
    }
    
    var userTags: String {
        var tags: String = String()
        for tag in self.user.tags {
            tags += ("#" + tag + "  ")
        }
        return tags
    }
    
    var other: String {
        "Other"
    }
    
    var userFavoriteFruit: String {
        "Favorite fruit: \(self.user.favoriteFruit)"
    }
    
    var userGreeting: String {
        "Greeting:\n\(self.user.greeting)"
    }
    
    var userRegistered: String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterShow = DateFormatter()
        dateFormatterShow.dateFormat = "MM-dd-yyyy HH:mm"
        guard let date: Date = dateFormatterGet.date(from: self.user.registered) else { return Date.now.formatted() }
        return "Registered: \(dateFormatterShow.string(from: date))"
    }
    
    var userFriends: [Friend] {
        self.user.friends
    }
    
    func selectedShowMore(about: String) -> AboutUserViewModelProtocol {
        return AboutUserViewModel(about: self.user.about)
    }
    
    func selectedShowFriends(friends: [Friend]) -> FriendsUserViewModelProtocol {
        return FriendsUserViewModel(friends: self.user.friends)
    }
    
    func selectedShowLocation(name: String, latitude: Double, longitude: Double) -> LocationUserViewModelProtocol {
        return LocationUserViewModel(name: self.user.name, latitude: self.user.latitude, longitude: self.user.longitude)
    }
}
