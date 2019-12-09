//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
let countryController = CountryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = self.searchBar.text else {return}
        
        self.countryController.fetchCountry(searchTerm: searchTerm) { (countries, error) in
            if let error = error {
                NSLog("error searching for countries: \(error)")
            }
            if let countries = countries {
                DispatchQueue.main.async {
                    self.countryController.countries = countries
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return countryController.countries.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        
        cell.textLabel?.text = countryController.countries[indexPath.row].name
       

        return cell
    }
   

   

 
 
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let navigationController = segue.destination as? UINavigationController,
                let countryDetailVC = navigationController.topViewController as? CountryDetailViewController else {fatalError()}
       
        countryDetailVC.country = countryController.countries[indexPath.row]
    }
 
    }
}
