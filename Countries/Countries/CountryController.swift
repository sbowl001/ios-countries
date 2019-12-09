//
//  CountryController.swift
//  Countries
//
//  Created by Stephanie Bowles on 12/9/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case get = "GET"
}

enum NetworkError: Error {
    case otherError
    case badData
}



class CountryController {
    var countries: [Country] = []
    
    let baseURL = URL(string: "https://restcountries.eu/rest/v2/name/")!
    
    func fetchCountry(searchTerm: String, completion: @escaping ([Country]?, Error?) -> Void) {
        let countryURL = baseURL.appendingPathComponent(searchTerm)
        
        var request = URLRequest(url: countryURL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, result, error) in
            if let error = error {
                NSLog("error fetching data: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            guard let data = data else {
                NSLog("no data returned")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let countries = try jsonDecoder.decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(countries, nil)
                }
            } catch {
                NSLog("Error decoding country object: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
        }.resume()
    }
}
