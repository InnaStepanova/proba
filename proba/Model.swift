//
//  Model.swift
//  proba
//
//  Created by Инна Степанова on 08.02.2022.
//


struct Category: Decodable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
    
}

struct Meal: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?


}

struct Categories: Decodable {
    let categories: [Category]
}

struct Meals: Decodable {
    let meals: [Meal]
}
