//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    var country: Country? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem //makes a problem for iphone back button
               navigationItem.leftItemsSupplementBackButton = true //fixes Iphone new problem
               
               updateViews()
    }
    

    func updateViews(){
        guard let country = country,
            isViewLoaded else {return}
        title = country.name 
    }
}
