//
//  NetworkManager.swift
//  proba
//
//  Created by Инна Степанова on 08.02.2022.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCategories(from urlString: String, with complition: @escaping (Categories) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            
            if let responce = responce {
                print(responce)
            }
            guard let data = data else {return}
            do {
                let categories = try JSONDecoder().decode(Categories.self, from: data)
                DispatchQueue.main.async {
                    complition(categories)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    

    
    func fetchMeals(from urlString: String, with complition: @escaping (Meals) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            
            if let responce = responce {
                print(responce)
            }
            guard let data = data else {return}
            do {
                let meals = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    complition(meals)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}

