//
//  StoryboardLoad.swift
//  InfoGym
//
//  Created by Adam Szeremeta on 28.04.2016.
//  Copyright © 2016 Rst-It. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardLoad: class {
    
    /** The storyboard idendifier */
    static var storyboardId: String { get }
    
    /** The controller identifier in the storyboard */
    static var storyboardControllerId: String { get }
    
}

extension StoryboardLoad where Self: UIViewController {
    
    static var storyboardControllerId: String {
        
        return String(describing: Self.self)
    }
    
    static func loadFromStoryboard() -> Self {
        
        let bundle = Bundle(for: Self.self)
        let storyboard = UIStoryboard(name: Self.storyboardId, bundle: bundle)
        
        return storyboard.instantiateViewController(withIdentifier: Self.storyboardControllerId) as! Self
    }
    
}
