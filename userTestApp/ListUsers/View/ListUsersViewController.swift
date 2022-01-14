//
//  ListUsersViewController.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class ListUsersViewController: UIViewController {
    
    private let listUsersView = ListUsersView()
    
    private var viewModel: ListUsersViewModelProtocol? {
        didSet {
            self.viewModel?.fetchUsers {
                self.listUsersView.usersCollectionView.reloadData()
                self.listUsersView.usersTableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.updateNavBar()
        
        self.viewModel = ListUsersViewModel()
        
        self.listUsersView.frame = self.view.bounds
        self.view.addSubview(self.listUsersView)
        
        self.listUsersView.usersCollectionView.delegate = self
        self.listUsersView.usersCollectionView.dataSource = self
        self.listUsersView.usersTableView.delegate = self
        self.listUsersView.usersTableView.dataSource = self
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func updateNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Users" //delete
    }

}


//MARK: - UICollectionViewDataSource
extension ListUsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.viewModel?.countUsers() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.listUsersView.usersCollectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.id, for:  indexPath)
        guard let userCell = cell as? UserCollectionViewCell else { return cell }
        userCell.viewModel = self.viewModel?.collectionViewCellViewModel(at: indexPath)
        
        return userCell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ListUsersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return Metrics.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return Metrics.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Metrics.widthCell, height: Metrics.heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: Metrics.spacing,
                            left: Metrics.spacing,
                            bottom: Metrics.spacing,
                            right: Metrics.spacing)
    }
}

//MARK: - UITableViewDataSource
extension ListUsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel?.countUsers() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listUsersView.usersTableView.dequeueReusableCell(withIdentifier: UserTableViewCell.id, for: indexPath)
        guard let userCell = cell as? UserTableViewCell else { return cell }
        userCell.viewModel = self.viewModel?.tableCellViewModel(at: indexPath)
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Metrics.heightTableCell
    }
}

//MARK: - UITableViewDelegate
extension ListUsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
