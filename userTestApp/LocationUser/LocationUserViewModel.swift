//
//  LocationUserViewModel.swift
//  userTestApp
//
//  Created by pavel on 16.01.22.
//

import Foundation

protocol LocationUserViewModelProtocol {
    var userNamePinInfo: String { get }
    var userLatitude: Double { get }
    var userLongitude: Double { get }
    init(name: String, latitude: Double, longitude: Double)
}

final class LocationUserViewModel: LocationUserViewModelProtocol {
    
    var userNamePinInfo: String
    var userLatitude: Double
    var userLongitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.userNamePinInfo = name
        self.userLatitude = latitude
        self.userLongitude = longitude
    }
}
