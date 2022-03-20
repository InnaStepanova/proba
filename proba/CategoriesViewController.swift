//
//  CategoriesViewController.swift
//  proba
//
//  Created by Инна Степанова on 14.02.2022.
//

import UIKit

class CategoriesViewController: UICollectionViewController {
    
    var categories: [Category] = []
    let categoriesURL = "https://www.themealdb.com/api/json/v1/1/categories.php"
    var titleq = "Categories"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleq
        getCategories()
    }

  

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoriesViewCell
        let category = categories[indexPath.item]
        cell.set(object: category)
    
        return cell
    }
    
    func getCategories() {
        NetworkManager.shared.fetchCategories(from: categoriesURL) { categories in
            self.categories = categories.categories
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "allMealInCategory" {
            guard let allMealsInCategoryVC = segue.destination as? TableViewController else {return}
            guard let cell = sender as? CategoriesViewCell else {return}
            allMealsInCategoryVC.URL = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(cell.categoriesNameLabel.text ?? "")"
            allMealsInCategoryVC.newTitle = cell.categoriesNameLabel.text ?? ""
        }
    }
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidh = 20 * (itemsPerRow  + 1)
        let aviableWidh = collectionView.frame.width - paddingWidh
        let widhPerItem = aviableWidh / itemsPerRow

        return CGSize(width: widhPerItem, height: widhPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
