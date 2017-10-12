//
//  UsersViewController.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

protocol UsersViewControllerOutput: class, UserDetailsPresenterDelegate {
    func fetchUsers()
    func showUserDetails()
    func close()
}

protocol UsersViewControllerInput: class {
    func changeLoadingState(isLoading: Bool)
    func displayFetchedUsers(_ users: [Person])
    func displayError(message: String)
    func displayAddedUser(user: Person)
}

class UsersViewController: UIViewController, StoryboardLoad {
    
    deinit { print("deinit \(type(of: self))") }
    
    // MARK: Constants
    
    struct Constants {
        static let errorTitle = "Error"
    }
    
    // MARK: StoryboardLoad
    
    static var storyboardId: String = "Users"
    
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: Properties
    
    var presenter: UsersViewControllerOutput!
    var users = [Person]()
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performFetchUsers()
    }
    
    // MARK: Actions
    
    @IBAction func addBarButtonTapped(sender: UIBarButtonItem) {
        presenter.showUserDetails()
    }
    
    @IBAction func closeBarButtonTapped(sender: UIBarButtonItem) {
        presenter.close()
    }
    
    // Request users using presenter
    func performFetchUsers() {
        presenter.fetchUsers()
    }
    
}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: UsersTableViewCell.self, for: indexPath)
        
        let user = users[indexPath.row]
    
        cell.configureWith(firstName: user.firstName, lastName: user.lastName)
        
        return cell
    }
    
}

extension UsersViewController: UsersViewControllerInput {
    
    func changeLoadingState(isLoading: Bool) {
        isLoading ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
    }
    
    // Presenter wants to refresh UI with fetched users
    func displayFetchedUsers(_ users: [Person]) {
        self.users.append(contentsOf: users)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayAddedUser(user: Person) {
        users.append(user)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayError(message: String) {
        let alert = UIAlertController(title: Constants.errorTitle, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
}
