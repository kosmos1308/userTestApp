//
//  AboutUserViewModel.swift
//  userTestApp
//
//  Created by pavel on 16.01.22.
//

import Foundation

protocol AboutUserViewModelProtocol {
    var userAbout: String { get set }
    init(about: String)
}

final class AboutUserViewModel: AboutUserViewModelProtocol {
    
    var userAbout: String
    
    init(about: String) {
        self.userAbout = about
    }
}
