//
//  MealDetailsViewController.swift
//  proba
//
//  Created by Инна Степанова on 21.02.2022.
//

import UIKit

class MealDetailsViewController: UIViewController {
    
    var URL = ""
   
    @IBOutlet var contryOfMeal: UILabel!
    @IBOutlet var mealImage: ImageView!
    @IBOutlet var receptMeal: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchMeals(from: URL) { meals in
            let meal = meals.meals[0]
            self.title = meal.strMeal
            self.mealImage.fetchImage(from: meal.strMealThumb ?? "")
            self.contryOfMeal.text = "Country: \(meal.strArea ?? "")"
            self.receptMeal.text = meal.strInstructions
        }
    }
}
