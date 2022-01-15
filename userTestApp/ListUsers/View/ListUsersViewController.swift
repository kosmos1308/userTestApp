//
//  ListUsersViewController.swift
//  userTestApp
//
//  Created by pavel on 14.01.22.
//

import UIKit

final class ListUsersViewController: UIViewController {
    
    private let listUsersView = ListUsersView()
    
    private var sortAgeUsersArray = [User]()
    private var filtrGenderArray = [User]()
    
    private var viewModel: ListUsersViewModelProtocol? {
        didSet {
            self.viewModel?.fetchUsers {
                self.listUsersView.usersCollectionView.reloadData()
                self.listUsersView.usersTableView.reloadData()
            }
            
            self.viewModel?.sortAgeUsers = { [weak self] sortUsers in
                self?.filtrGenderArray.removeAll()
                self?.sortAgeUsersArray = sortUsers
                self?.listUsersView.usersTableView.reloadData()
            }
            
            self.viewModel?.filterGender = { [weak self] filtrGender in
                self?.sortAgeUsersArray.removeAll()
                self?.filtrGenderArray = filtrGender
                self?.listUsersView.usersTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.viewModel = ListUsersViewModel()
        
        self.listUsersView.frame = self.view.bounds
        self.view.addSubview(self.listUsersView)
        
        self.updateNavBar()
        self.setupTableAndCollectionView()
    }
    
    
    func setupTableAndCollectionView() {
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
        self.title = "Users"
        let ageUpBarButton = UIBarButtonItem(title: "age ↑",
                                             style: .plain,
                                             target: self,
                                             action: #selector(sortAgeUpButtonTapped))
        let ageDownBarButton = UIBarButtonItem(title: "age ↓",
                                            style: .plain,
                                            target: self,
                                            action: #selector(sortAgeDownButtonTapped))
        self.navigationItem.rightBarButtonItems = [ageDownBarButton, ageUpBarButton]
        
        
        let maleBarButton = UIBarButtonItem(title: "🙎‍♂️ male",
                                            style: .plain,
                                            target: self,
                                            action: #selector(maleButtonTapped))
        let femaleBarButton = UIBarButtonItem(title: "🙍‍♀️ female",
                                            style: .plain,
                                            target: self,
                                            action: #selector(femaleButtonTapped))
        self.navigationItem.leftBarButtonItems = [maleBarButton, femaleBarButton]
    }
    
    private func nextVC(at indexPath: IndexPath) {
        let detailViewModel = self.viewModel?.selectedCell(at: indexPath)
        let detailVC = DetailUserViewController()
        detailVC.viewModel = detailViewModel
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc private func sortAgeUpButtonTapped() {
        self.viewModel?.sortAgeUpUsersPressed()
    }
    
    @objc private func sortAgeDownButtonTapped() {
        self.viewModel?.sortAgeDownUsersPressed()
    }
           
    @objc private func maleButtonTapped() {
        self.viewModel?.malePressed()
    }
    
    @objc private func femaleButtonTapped() {
        self.viewModel?.femalePressed()
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
        self.nextVC(at: indexPath)
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
        
        if self.filtrGenderArray.isEmpty {
            return self.viewModel?.countUsers() ?? 0
        } else {
            return self.filtrGenderArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.listUsersView.usersTableView.dequeueReusableCell(withIdentifier: UserTableViewCell.id, for: indexPath)
        guard let userCell = cell as? UserTableViewCell else { return cell }
        userCell.viewModel = self.viewModel?.tableCellViewModel(at: indexPath)
        
        if sortAgeUsersArray.isEmpty && filtrGenderArray.isEmpty {
            userCell.viewModel = self.viewModel?.tableCellViewModel(at: indexPath)
        } else if sortAgeUsersArray.isEmpty == false {
            userCell.nameLabel.text = self.sortAgeUsersArray[indexPath.row].name
            userCell.ageLabel.text = "\(self.sortAgeUsersArray[indexPath.row].age)"
            userCell.genderLabel.text = self.sortAgeUsersArray[indexPath.row].gender
        } else if filtrGenderArray.isEmpty == false {
            userCell.nameLabel.text = self.filtrGenderArray[indexPath.row].name
            userCell.ageLabel.text = "\(self.filtrGenderArray[indexPath.row].age)"
            userCell.genderLabel.text = self.filtrGenderArray[indexPath.row].gender
        }
    
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
        //self.nextVC(at: indexPath)
    }
}
