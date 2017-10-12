//
//  DetailsViewController.swift
//  MVVM-C Example
//
//  Created by Łukasz Śliwiński on 06/09/16.
//  Copyright © 2016 Plum's organization. All rights reserved.
//

import UIKit

protocol UserDetailsViewControllerOutput: class {
    weak var delegate: UserDetailsPresenterDelegate? { get set }
    
    func saveUser(firstName: String?, lastName: String?)
    func validateForm(firstName: String?, lastName: String?)
    func showInfo()
}

protocol UserDetailsViewControllerInput: class {
    func setSaveButtonEnabledState(enabled: Bool)
}

class UserDetailsViewController: UIViewController, StoryboardLoad {

    deinit { print("deinit \(type(of: self))") }
    
    // MARK: StoryboardLoad
    
    static var storyboardId: String = "UserDetails"

    // MARK: IBOutlets

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    // MARK: Properties
    
    var presenter: UserDetailsViewControllerOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.addTarget(self, action: #selector(textFieldTextChanged(textField:)), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldTextChanged(textField:)), for: .editingChanged)
        
        presenter.validateForm(firstName: firstNameTextField.text, lastName: lastNameTextField.text)
    }

    // MARK: Actions

    @IBAction func saveButtonTapped(sender: UIButton) {
        presenter.saveUser(firstName: firstNameTextField.text, lastName: lastNameTextField.text)
    }

    @IBAction func infoButtonTapped(sender: UIButton) {
        presenter.showInfo()
    }

    @objc func textFieldTextChanged(textField: UITextField) {
        presenter.validateForm(firstName: firstNameTextField.text, lastName: lastNameTextField.text)
    }

}

extension UserDetailsViewController: UserDetailsViewControllerInput {

    func setSaveButtonEnabledState(enabled: Bool) {
        saveButton.isEnabled = enabled
    }

}
