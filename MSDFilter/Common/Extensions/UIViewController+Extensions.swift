//
//  UIViewController+Extensions.swift
//  MSDFilter
//
//  Created by Mohamed El Gedawy on 27/09/2021.
//

import UIKit

protocol StoryboardInitializable: Identifiable {
    static func initFromStoryboard(storyboard: Constants.Storyboard) -> Self
}

extension StoryboardInitializable where Self: UIViewController {
    static func initFromStoryboard(storyboard: Constants.Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyboard.name, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}

extension UIViewController: StoryboardInitializable {}
