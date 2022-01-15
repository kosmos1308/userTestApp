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
    
    lazy var aboutTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 17)
        return textView
    }()
    
    //add button "show more ..."
}
