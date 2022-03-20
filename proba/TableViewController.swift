//
//  TableViewController.swift
//  proba
//
//  Created by Инна Степанова on 08.02.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var meals: [Meal] = []
    var URL = ""
    var newTitle = "All Meals"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = newTitle
        tableView.rowHeight = 100
        
        if URL == "" {
            getMeals2()
        } else {
           getMeals()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let meal = meals[indexPath.row]
        cell.set(object: meal)
        return cell
    }
    
    func getMeals2() {
        let alphabet:[Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        for letter in alphabet {
            NetworkManager.shared.fetchMeals(from: "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)") { meals in
                self.meals += meals.meals
                self.tableView.reloadData()
            }
        }
    }
    
        func getMeals() {
            NetworkManager.shared.fetchMeals(from: URL) { meals in
                    self.meals = meals.meals
                    self.tableView.reloadData()
                }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mealDetails" {
            guard let mealDetailsVC = segue.destination as? MealDetailsViewController else {return}
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            mealDetailsVC.URL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(meals[indexPath.row].idMeal!)"
        }
    }
}
