//
//  AuthViewController.swift
//  MVVM-C Example
//
//  Created by Łukasz Śliwiński on 05/09/16.
//  Copyright © 2016 Plum's organization. All rights reserved.
//

import UIKit

protocol AuthenticationViewControllerOutput: class {
    func login(username: String?, password: String?)
    func validate(username: String?, password: String?)
}

protocol AuthenticationViewControllerInput: class {
    func setLoginEnabled(enabled: Bool)
    func setInvalidCredentailsMessage(message: String)
}

class AuthenticationViewController: UIViewController, StoryboardLoad {

    deinit { print("deinit \(type(of: self))") }
    
    // MARK: StoryboardLoad
    
    static var storyboardId: String = "Authentication"

    // MARK: IBOutlets

    @IBOutlet weak var errorIndicatorLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    // MARK: Properties

    var presenter: AuthenticationViewControllerOutput!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.validate(username: usernameTextField.text, password: passwordTextField.text)

        usernameTextField.addTarget(self, action: #selector(textFieldTextChanged(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldTextChanged(textField:)), for: .editingChanged)
    }

    // MARK: Actions

    @IBAction func loginButtonTapped(sender: UIButton) {
        presenter.login(username: usernameTextField.text, password: passwordTextField.text)
    }

    @objc func textFieldTextChanged(textField: UITextField) {
        presenter.validate(username: usernameTextField.text, password: passwordTextField.text)
    }

}

extension AuthenticationViewController: AuthenticationViewControllerInput {
    
    func setInvalidCredentailsMessage(message: String) {
        errorIndicatorLabel.text = message
    }
    
    func setLoginEnabled(enabled: Bool) {
        loginButton.isEnabled = enabled
    }
    
}
