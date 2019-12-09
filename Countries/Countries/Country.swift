//
//  Country.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation


struct Country: Codable {
    let name: String
    let region: String
    let capital: String
    let population: Int
    let currencies: [Currency]
    let languages: [Language]
    let alpha3Code: String
    
    
}

struct Currency: Codable {
    let name: String
    let symbol: String
}

struct Language: Codable {
    let name: String

}
