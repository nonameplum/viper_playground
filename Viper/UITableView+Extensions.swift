//
//  UITableView+Extensions.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, for indexPath: IndexPath) -> T where T: ReuseIdentifier {
        return self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as! T
    }
    
}
