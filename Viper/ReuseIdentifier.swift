//
//  ReuseIdentifier.swift
//  Viper
//
//  Created by Łukasz Śliwiński on 9/23/16.
//  Copyright © 2016 Łukasz Śliwiński. All rights reserved.
//

import UIKit

public protocol ReuseIdentifier: class {
    static var reuseIdentifier: String { get }
}

public extension ReuseIdentifier where Self: UIView {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
}
