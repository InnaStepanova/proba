//
//  CategoriesViewCell.swift
//  proba
//
//  Created by Инна Степанова on 24.02.2022.
//

import UIKit

class CategoriesViewCell: UICollectionViewCell {
    
    @IBOutlet var categoriesNameLabel: UILabel!
    @IBOutlet var categoriesImage: ImageView!
    
    func set(object: Category) {
        self.categoriesNameLabel.text = object.strCategory
        self.categoriesImage.fetchImage(from: object.strCategoryThumb ?? "")    }
}
