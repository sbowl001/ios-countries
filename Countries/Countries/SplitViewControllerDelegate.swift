//
//  SplitViewControllerDelegate.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class SplitViewControllerDelegate: NSObject, UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
