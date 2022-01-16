//
//  AboutUserViewController.swift
//  userTestApp
//
//  Created by pavel on 15.01.22.
//

import UIKit

final class AboutUserViewController: UIViewController {
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.tintColor = .systemRed
        button.layer.cornerRadius = Metrics.cornerRadiusCloseButton
        button.layer.borderColor = UIColor.systemRed.cgColor
        button.layer.borderWidth = 1.5
        return button
    }()
    
    private lazy var aboutTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 20)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var viewModel: AboutUserViewModelProtocol? {
        didSet {
            self.aboutTextView.text = self.viewModel?.userAbout
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupAutoLayout()
        self.view.backgroundColor = .systemBackground
    }
    
    
    private func setupAutoLayout() {
        self.view.addSubview(self.closeButton)
        self.view.addSubview(self.aboutTextView)
        
        NSLayoutConstraint.activate([
            self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Metrics.top*2),
            self.closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingTextView),
            self.closeButton.heightAnchor.constraint(equalToConstant: Metrics.widthCloseButton),
            self.closeButton.widthAnchor.constraint(equalToConstant: Metrics.widthCloseButton)
        ])
        
        NSLayoutConstraint.activate([
            self.aboutTextView.topAnchor.constraint(equalTo: self.closeButton.bottomAnchor, constant: Metrics.top*2),
            self.aboutTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: Metrics.leadingTextView),
            self.aboutTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: Metrics.trailingTextView),
            self.aboutTextView.heightAnchor.constraint(equalToConstant: self.view.bounds.height/2)
        ])
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
