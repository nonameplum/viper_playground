//
//  InfoViewController.swift
//  MVVM-R
//
//  Created by Łukasz Śliwiński on 17/09/16.
//  Copyright © 2016 Plum's organization. All rights reserved.
//

import UIKit

protocol InfoViewControllerOutput: class {
    func goBack()
    func goHome()
}

class InfoViewController: UIViewController, StoryboardLoad {

    deinit { print("deinit \(type(of: self))") }
    
    // MARK: StoryboardLoad
    
    static var storyboardId: String = "Info"

    // MARK: Properties

    var presenter: InfoViewControllerOutput!
    
    // MARK: Actions

    @IBAction func dismissButtonTapped(sender: UIButton) {
        presenter.goBack()
    }

    @IBAction func homeButtonTapped(sender: UIButton) {
        presenter.goHome()
    }

}
