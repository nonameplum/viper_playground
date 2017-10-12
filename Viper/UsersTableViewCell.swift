//
//  UsersTableViewCell.swift
//  MVVM-R
//
//  Created by Łukasz Śliwiński on 9/22/16.
//  Copyright © 2016 Plum's organization. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell, ReuseIdentifier {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    func configureWith(firstName: String?, lastName: String?) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
    }
    
}
