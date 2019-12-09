//
//  CountryDetailViewController.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    @IBOutlet weak var languagesLabel: UILabel!
    
    @IBOutlet weak var currenciesLabel: UILabel!
    
    @IBOutlet weak var populationLabel: UILabel!
    
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
        self.flagImageView.image = UIImage(named: country.alpha3Code.lowercased())
        self.nameLabel.text = country.name
        self.populationLabel.text = String(country.population)
        self.regionLabel.text = country.region
        self.capitalLabel.text = country.capital
        
      
        
        let languages = country.languages.map { $0.name }
              self.languagesLabel.text = languages.joined()
              
              let currencies = country.currencies.map { $0.name }
              self.currenciesLabel.text = currencies.joined()
    }
}
